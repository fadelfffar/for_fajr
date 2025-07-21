// comment_screen.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

/// Push this route from FeedScreen:
/// Navigator.of(context).push(MaterialPageRoute(
///   builder: (_) => CommentScreen(postId: postId, userId: userId),
/// ));
class CommentScreen extends StatefulWidget {
  final String postId;
  final String userId;
  const CommentScreen(required String postId, {required this.postId, required this.userId, Key? key})
      : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  // Real-time comment stream
  late final _stream = Supabase.instance.client
      .from('comments')
      .stream(primaryKey: ['id'])
      .eq('post_id', widget.postId)
      .order('timestamp');

  // Reply state
  String? _replyingToId;
  String? _replyingToUsername;

  // Insert comment or reply
  Future<void> _submit() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final data = _dummyAuthorData(); // Replace with your real logic
    final payload = {
      'user_id': widget.userId,
      'post_id': widget.postId,
      'author': data.author,
      'username': data.username,
      'content': text,
      'timestamp': DateTime.now().toIso8601String(),
      'reactions': 0,
      'shares': 0,
      'discussions': 0,
      'is_reacted': false,
      if (_replyingToId != null) 'parent_comment_id': _replyingToId,
    };

    try {
      await Supabase.instance.client.from('comments').insert(payload);
      _controller.clear();
      setState(() {
        _replyingToId = null;
        _replyingToUsername = null;
      });
      // Scroll to bottom
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error posting comment: $e')),
      );
    }
  }

  // Dummy helper – replace with your actual user profile fetch
  ({String author, String username}) _dummyAuthorData() {
    // Example: pull from your cached profile
    return (author: 'Current User', username: '@current');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final comments = _buildCommentTree(snapshot.data!);

                if (comments.isEmpty) {
                  return const Center(child: Text('No comments yet.'));
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: comments.length,
                  itemBuilder: (_, i) => _CommentItem(
                    comment: comments[i],
                    onReply: (id, username) {
                      setState(() {
                        _replyingToId = id;
                        _replyingToUsername = username;
                      });
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                );
              },
            ),
          ),
          _CommentInput(
            controller: _controller,
            hint: _replyingToUsername == null
                ? 'Add a comment...'
                : 'Replying to $_replyingToUsername...',
            onSubmit: _submit,
            onCancelReply: () {
              setState(() {
                _replyingToId = null;
                _replyingToUsername = null;
              });
            },
            showCancel: _replyingToUsername != null,
          ),
        ],
      ),
    );
  }

  // Build a flat list with nested replies
  List<CommentNode> _buildCommentTree(List<Map<String, dynamic>> flat) {
    final nodes = <String, CommentNode>{};
    final root = <CommentNode>[];

    for (final raw in flat) {
      nodes[raw['id'].toString()] = CommentNode(raw);
    }

    for (final node in nodes.values) {
      final parentId = node.data['parent_comment_id']?.toString();
      if (parentId == null || !nodes.containsKey(parentId)) {
        root.add(node);
      } else {
        nodes[parentId]!.replies.add(node);
      }
    }
    return root;
  }
}

/// Simple tree node
class CommentNode {
  final Map<String, dynamic> data;
  final List<CommentNode> replies = [];
  CommentNode(this.data);
}

/// Single comment widget (recursive for replies)
class _CommentItem extends StatelessWidget {
  final CommentNode comment;
  final ValueChanged<String, String> onReply;

  const _CommentItem({required this.comment, required this.onReply});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final author = comment.data['author'] as String? ?? 'Anonymous';
    final username = comment.data['username'] as String? ?? '';
    final content = comment.data['content'] as String;
    final timestamp = DateTime.parse(comment.data['timestamp'] as String);
    final time = DateFormat('MMM d, h:mm a').format(timestamp);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: theme.primaryColor.withOpacity(.2),
                child: Text(author.characters.first.toUpperCase(),
                    style: theme.textTheme.labelSmall),
              ),
              const SizedBox(width: 8),
              Text(author, style: theme.textTheme.labelLarge),
              const SizedBox(width: 4),
              Text(username,
                  style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withOpacity(.6))),
              const Spacer(),
              Text(time,
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: theme.disabledColor)),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(content, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () =>
                      onReply(comment.data['id'].toString(), username.replaceAll('@', '')),
                  child: Text('Reply',
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: theme.primaryColor)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Nested replies
          if (comment.replies.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: comment.replies
                    .map((r) => _CommentItem(comment: r, onReply: onReply))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

/// Bottom input bar
class _CommentInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onSubmit;
  final VoidCallback? onCancelReply;
  final bool showCancel;

  const _CommentInput({
    required this.controller,
    required this.hint,
    required this.onSubmit,
    this.onCancelReply,
    required this.showCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).dividerColor.withOpacity(.05))),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                onSubmitted: (_) => onSubmit(),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: onSubmit,
            ),
            if (showCancel)
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onCancelReply,
                tooltip: 'Cancel reply',
              ),
          ],
        ),
      ),
    );
  }
}

// Data Models
class PostModel {
  // TODO(): change to uuid generator using pub dev package?
  String id;
  String author;
  String username;
  String content;
  DateTime timestamp;
  int reactions;
  int shares;
  int discussions;
  bool isReacted;

  PostModel({
    required this.id,
    required this.author,
    required this.username,
    required this.content,
    required this.timestamp,
    required this.reactions,
    required this.shares,
    required this.discussions,
    required this.isReacted,
  });
  // Factory constructor for JSON deserialization
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      author: json['author'] as String,
      username: json['username'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      reactions: json['reactions'] as int,
      shares: json['shares'] as int,
      discussions: json['discussions'] as int,
      isReacted: json['is_reacted'] as bool? ?? false,
    );
  }

  // Convert to JSON for database operations
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'username': username,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'reactions': reactions,
      'shares': shares,
      'discussions': discussions,
      'is_reacted': isReacted,
    };
  }
}