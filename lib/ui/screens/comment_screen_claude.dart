import 'package:flutter/material.dart';

// Comment model
class IslamicComment {
  final String id;
  final String author;
  final String username;
  final String content;
  final DateTime timestamp;
  int reactions;
  bool isReacted;
  final Color profileColor;
  final String? parentId; // For replies
  final int depth; // For nested replies

  IslamicComment({
    required this.id,
    required this.author,
    required this.username,
    required this.content,
    required this.timestamp,
    required this.reactions,
    required this.isReacted,
    required this.profileColor,
    this.parentId,
    this.depth = 0,
  });
}

// Updated PostModel model to include comments
class PostModel {
  final String id;
  final String author;
  final String username;
  final String content;
  final DateTime timestamp;
  int reactions;
  final int shares;
  int discussions;
  bool isReacted;
  final Color profileColor;
  List<IslamicComment> comments;

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
    required this.profileColor,
    this.comments = const [],
  });
}

class CommentScreen extends StatefulWidget {
  final PostModel post;

  const CommentScreen({Key? key, required this.post}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();
  final FocusNode _replyFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  
  String? _replyingToId;
  String? _replyingToUsername;
  bool _isComposing = false;

  List<IslamicComment> comments = [
    IslamicComment(
      id: '1',
      author: 'Sister Fatima',
      username: 'fatima_light',
      content: 'SubhanAllah! This is exactly what I needed to hear today. JazakAllahu khair for this beautiful reminder. May Allah grant you immense reward for sharing this wisdom.',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      reactions: 12,
      isReacted: false,
      profileColor: Colors.purple,
    ),
    IslamicComment(
      id: '2',
      author: 'Brother Omar',
      username: 'omar_seeker',
      content: 'Alhamdulillah! This hadith always brings peace to my heart. We should all strive to implement this in our daily lives.',
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
      reactions: 8,
      isReacted: true,
      profileColor: Colors.blue,
    ),
    IslamicComment(
      id: '3',
      author: 'Ustadha Khadijah',
      username: 'ustadha_khadijah',
      content: 'MashaAllah, beautiful post! This reminds me of the verse in Surah Al-Baqarah: "And whoever relies upon Allah - then He is sufficient for him. Indeed, Allah will accomplish His purpose." (65:3)',
      timestamp: DateTime.now().subtract(Duration(minutes: 25)),
      reactions: 23,
      isReacted: false,
      profileColor: Colors.green,
    ),
    IslamicComment(
      id: '4',
      author: 'Sister Aisha',
      username: 'aisha_journey',
      content: 'Ameen! May Allah increase us all in beneficial knowledge and righteous deeds.',
      timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      reactions: 15,
      isReacted: true,
      profileColor: Colors.orange,
      parentId: '1',
      depth: 1,
    ),
    IslamicComment(
      id: '5',
      author: 'Brother Yusuf',
      username: 'yusuf_truth',
      content: 'This is why I love this community. Always learning and growing together fi sabilillah.',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
      reactions: 6,
      isReacted: false,
      profileColor: Colors.indigo,
    ),
  ];

  @override
  void dispose() {
    _commentController.dispose();
    _replyController.dispose();
    _commentFocusNode.dispose();
    _replyFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Comments', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF004D40),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Original Post Summary
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.post.profileColor,
                      radius: 20,
                      child: Text(
                        widget.post.author[0].toUpperCase(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.post.author,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            '@${widget.post.username}',
                            style: TextStyle(color: Colors.grey[600], fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      _formatTimestamp(widget.post.timestamp),
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  widget.post.content,
                  style: TextStyle(fontSize: 15, height: 1.4),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 16),
                    SizedBox(width: 4),
                    Text('${widget.post.reactions}', style: TextStyle(fontSize: 12)),
                    SizedBox(width: 16),
                    Icon(Icons.comment, color: Colors.grey, size: 16),
                    SizedBox(width: 4),
                    Text('${comments.length}', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          
          // Comments List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(0),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return _buildCommentItem(comments[index]);
              },
            ),
          ),
          
          // Reply indicator
          if (_replyingToId != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Color(0xFF004D40).withValues(alpha:  .1),
              child: Row(
                children: [
                  Icon(Icons.reply, color: Color(0xFF004D40), size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Replying to @$_replyingToUsername',
                    style: TextStyle(color: Color(0xFF004D40), fontSize: 14),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _replyingToId = null;
                        _replyingToUsername = null;
                      });
                    },
                    child: Icon(Icons.close, color: Color(0xFF004D40), size: 16),
                  ),
                ],
              ),
            ),
          
          // Comment Input
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              children: [
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    focusNode: _commentFocusNode,
                    maxLines: null,
                    onChanged: (value) {
                      setState(() {
                        _isComposing = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: _replyingToId != null 
                          ? 'Write a respectful reply...'
                          : 'Write a thoughtful comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Color(0xFF004D40)),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: _isComposing ? _submitComment : null,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _isComposing ? Color(0xFF004D40) : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      color: _isComposing ? Colors.white : Colors.grey[500],
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(IslamicComment comment) {
    return Container(
      margin: EdgeInsets.only(
        left: comment.depth * 20.0,
        right: 0,
        bottom: 1,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: comment.depth > 0 
              ? BorderSide(color: Color(0xFF004D40).withValues(alpha: 0.3), width: 2)
              : BorderSide.none,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: comment.profileColor,
                radius: 16,
                child: Text(
                  comment.author[0].toUpperCase(),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          comment.author,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '@${comment.username}',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      _formatTimestamp(comment.timestamp),
                      style: TextStyle(color: Colors.grey[500], fontSize: 11),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                icon: Icon(Icons.more_vert, color: Colors.grey[400], size: 16),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.report, color: Colors.orange, size: 16),
                        SizedBox(width: 8),
                        Text('Report'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.block, color: Colors.red, size: 16),
                        SizedBox(width: 8),
                        Text('Block User'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            comment.content,
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    comment.isReacted = !comment.isReacted;
                    comment.reactions += comment.isReacted ? 1 : -1;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      comment.isReacted ? Icons.favorite : Icons.favorite_border,
                      color: comment.isReacted ? Colors.red : Colors.grey,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${comment.reactions}',
                      style: TextStyle(
                        color: comment.isReacted ? Colors.red : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 24),
              GestureDetector(
                onTap: () => _startReply(comment),
                child: Row(
                  children: [
                    Icon(Icons.reply, color: Colors.grey, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Reply',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 24),
              GestureDetector(
                onTap: () => _shareComment(comment),
                child: Row(
                  children: [
                    Icon(Icons.share, color: Colors.grey, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Share',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _startReply(IslamicComment comment) {
    setState(() {
      _replyingToId = comment.id;
      _replyingToUsername = comment.username;
    });
    _commentFocusNode.requestFocus();
  }

  void _submitComment() {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      final newComment = IslamicComment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        author: 'You',
        username: 'your_username',
        content: _commentController.text.trim(),
        timestamp: DateTime.now(),
        reactions: 0,
        isReacted: false,
        profileColor: Colors.teal,
        parentId: _replyingToId,
        depth: _replyingToId != null ? 1 : 0,
      );

      if (_replyingToId != null) {
        // Find the parent comment and add reply after it
        final parentIndex = comments.indexWhere((c) => c.id == _replyingToId);
        if (parentIndex != -1) {
          comments.insert(parentIndex + 1, newComment);
        }
      } else {
        comments.add(newComment);
      }

      _commentController.clear();
      _replyingToId = null;
      _replyingToUsername = null;
      _isComposing = false;
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Comment posted! Barakallahu feek.'),
        backgroundColor: Color(0xFF004D40),
        duration: Duration(seconds: 2),
      ),
    );

    // Scroll to bottom to show new comment
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _shareComment(IslamicComment comment) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Share Comment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.copy, color: Color(0xFF004D40)),
              title: Text('Copy Comment'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Comment copied to clipboard')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share, color: Color(0xFF004D40)),
              title: Text('Share Externally'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sharing functionality would be implemented here')),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }
}