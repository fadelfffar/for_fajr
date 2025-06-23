import 'package:flutter/material.dart';

class MinimalTextFeedScreen extends StatelessWidget {
  const MinimalTextFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Post> posts = List.generate(
      10,
      (index) => Post(
        username: 'ella$index',
        content:
            '"I realized something this morning.\nIt’s amazing how silence resets your mind.\nWe often underestimate the value of pauses."',
        timestamp: DateTime.now().subtract(Duration(days: index)),
        likes: 100 + index,
        comments: 5 + index,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('MindCast', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to new post screen
        },
        label: const Text('Write'),
        icon: const Icon(Icons.edit),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () {
                // TODO: Open full composer
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.add, size: 20, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "What's new today?",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => PostCard(post: posts[index]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Compose'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class Post {
  final String username;
  final String content;
  final DateTime timestamp;
  final int likes;
  final int comments;

  Post({
    required this.username,
    required this.content,
    required this.timestamp,
    required this.likes,
    required this.comments,
  });
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  String _formatTimeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return '${diff.inDays}d';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@${post.username} · ${_formatTimeAgo(post.timestamp)}',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            post.content,
            style: const TextStyle(
              fontSize: 17,
              height: 1.6,
              fontFamily: 'Georgia',
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.favorite_border, size: 18, color: Colors.grey[700]),
              const SizedBox(width: 4),
              Text('${post.likes}'),
              const SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey[700]),
              const SizedBox(width: 4),
              Text('${post.comments}'),
            ],
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}

class ThreadedFeedScreen extends StatefulWidget {
  const ThreadedFeedScreen({Key? key}) : super(key: key);

  @override
  State<ThreadedFeedScreen> createState() => _ThreadedFeedScreenState();
}

class _ThreadedFeedScreenState extends State<ThreadedFeedScreen> {
  final List<ThreadPost> posts = List.generate(
    5,
    (index) => ThreadPost(
      username: 'user$index',
      content: 'This is a text-only post by user$index. #thoughts @someone',
      timestamp: DateTime.now().subtract(Duration(hours: index * 3)),
      replies: List.generate(
        index,
        (i) => ThreadPost(
          username: 'replier$i',
          content: 'Reply $i to thread by user$index.',
          timestamp: DateTime.now().subtract(Duration(hours: i + 1)),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextThreads'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: posts.length,
        separatorBuilder: (_, __) => const Divider(height: 20),
        itemBuilder: (context, index) => ThreadCard(post: posts[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to post creation
        },
        child: const Icon(Icons.edit),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Write'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ThreadPost {
  final String username;
  final String content;
  final DateTime timestamp;
  final List<ThreadPost> replies;

  ThreadPost({
    required this.username,
    required this.content,
    required this.timestamp,
    this.replies = const [],
  });
}

class ThreadCard extends StatefulWidget {
  final ThreadPost post;

  const ThreadCard({Key? key, required this.post}) : super(key: key);

  @override
  State<ThreadCard> createState() => _ThreadCardState();
}

class _ThreadCardState extends State<ThreadCard> {
  bool showReplies = false;

  String _formatTimestamp(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return '${diff.inDays}d';
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 15),
            const SizedBox(width: 8),
            Text('@${post.username}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 6),
            Text('· ${_formatTimestamp(post.timestamp)}', style: TextStyle(color: Colors.grey[600]))
          ],
        ),
        const SizedBox(height: 8),
        Text(post.content, style: const TextStyle(fontSize: 16, height: 1.4)),
        const SizedBox(height: 12),
        Row(
          children: [
            TextButton(
              onPressed: () => setState(() => showReplies = !showReplies),
              child: Text('🔁 View replies (${post.replies.length})'),
            ),
            const Spacer(),
            Icon(Icons.favorite_border, size: 20),
            const SizedBox(width: 16),
            Icon(Icons.chat_bubble_outline, size: 20),
            const SizedBox(width: 16),
            Icon(Icons.bookmark_border, size: 20),
          ],
        ),
        if (showReplies && post.replies.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8),
            child: Column(
              children: post.replies.map((reply) => _ReplyItem(reply: reply)).toList(),
            ),
          ),
      ],
    );
  }
}

class _ReplyItem extends StatelessWidget {
  final ThreadPost reply;

  const _ReplyItem({Key? key, required this.reply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diff = DateTime.now().difference(reply.timestamp);
    final time = diff.inMinutes < 60
        ? '${diff.inMinutes}m'
        : diff.inHours < 24
            ? '${diff.inHours}h'
            : '${diff.inDays}d';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalDivider(width: 20, thickness: 2, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('@${reply.username}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(width: 6),
                    Text('· $time', style: TextStyle(color: Colors.grey[600]))
                  ],
                ),
                const SizedBox(height: 4),
                Text(reply.content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


