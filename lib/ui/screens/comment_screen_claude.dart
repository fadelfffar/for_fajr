import 'package:flutter/material.dart';

class IslamicComment {
  final String id;
  final String author;
  final String username;
  final String content;
  final DateTime timestamp;
  final int reactions;
  final bool isReacted;
  // TODO(): delete profileColor as you cannot have color datatype on supabase, option: remove it entirely or make a template color that user can choose from but make it so the data only stay within the app
  final Color profileColor;

  IslamicComment({
    required this.id,
    required this.author,
    required this.username,
    required this.content,
    required this.timestamp,
    required this.reactions,
    required this.isReacted,
    required this.profileColor,
  });
}

class CommentScreenV1 extends StatefulWidget {
  final String postId;
  final String postContent;
  final String postAuthor;

  const CommentScreenV1({
    Key? key,
    required this.postId,
    required this.postContent,
    required this.postAuthor,
  }) : super(key: key);

  @override
  _CommentScreenV1State createState() => _CommentScreenV1State();
}

class _CommentScreenV1State extends State<CommentScreenV1> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();
  String? _replyingTo;
  
  List<IslamicComment> comments = [
    IslamicComment(
      id: '1',
      author: 'Sister Fatima',
      username: 'fatima_deen',
      content: 'SubhanAllah, this is so beautifully said. May Allah reward you for sharing such beneficial words. 🤲',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      reactions: 12,
      isReacted: true,
      profileColor: Colors.purple,
    ),
    IslamicComment(
      id: '2',
      author: 'Brother Omar',
      username: 'omar_guidance',
      content: 'Allahu Akbar! This reminds me of the verse: "And whoever relies upon Allah - then He is sufficient for him. Indeed, Allah will accomplish His purpose." (65:3)',
      timestamp: DateTime.now().subtract(Duration(minutes: 8)),
      reactions: 8,
      isReacted: false,
      profileColor: Colors.indigo,
    ),
    IslamicComment(
      id: '3',
      author: 'Ustadha Khadija',
      username: 'ustadha_khadija',
      content: 'Barakallahu feeki sister! This is exactly what I needed to hear today. Sometimes we forget that Allah\'s timing is perfect.',
      timestamp: DateTime.now().subtract(Duration(minutes: 12)),
      reactions: 15,
      isReacted: true,
      profileColor: Colors.green,
    ),
    IslamicComment(
      id: '4',
      author: 'Brother Yusuf',
      username: 'yusuf_seeker',
      content: 'Ameen to this! May Allah strengthen our trust in Him during difficult times. 💚',
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
      reactions: 6,
      isReacted: false,
      profileColor: Colors.orange,
    ),
  ];

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D40),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comments',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${comments.length} thoughtful responses',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Original Post Preview
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xFF004D40),
                      child: Icon(Icons.person, color: Colors.white, size: 16),
                    ),
                    SizedBox(width: 8),
                    Text(
                      widget.postAuthor,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004D40),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  widget.postContent,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey[300]),
              ],
            ),
          ),
          
          // Comments List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return _buildCommentCard(comments[index]);
              },
            ),
          ),
          
          // Comment Input
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                if (_replyingTo != null)
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF004D40).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.reply, size: 16, color: Color(0xFF004D40)),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Replying to $_replyingTo',
                            style: TextStyle(
                              color: Color(0xFF004D40),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, size: 16),
                          onPressed: () {
                            setState(() {
                              _replyingTo = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        focusNode: _commentFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Share your thoughts with respect and wisdom...',
                          hintStyle: TextStyle(color: Colors.grey[500]),
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
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF004D40),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: _postComment,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentCard(IslamicComment comment) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: comment.profileColor,
                child: Text(
                  comment.author[0].toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004D40),
                      ),
                    ),
                    Text(
                      '@${comment.username}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _formatTime(comment.timestamp),
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            comment.content,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              _buildActionButton(
                icon: comment.isReacted ? Icons.favorite : Icons.favorite_border,
                label: comment.reactions.toString(),
                color: comment.isReacted ? Colors.red : Colors.grey[600]!,
                onTap: () {
                  setState(() {
                    // Toggle reaction logic here
                  });
                },
              ),
              SizedBox(width: 16),
              _buildActionButton(
                icon: Icons.reply,
                label: 'Reply',
                color: Colors.grey[600]!,
                onTap: () {
                  setState(() {
                    _replyingTo = comment.author;
                  });
                  _commentFocusNode.requestFocus();
                },
              ),
              Spacer(),
              _buildActionButton(
                icon: Icons.more_horiz,
                label: '',
                color: Colors.grey[600]!,
                onTap: () => _showCommentOptions(comment),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          if (label.isNotEmpty) ...[
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _postComment() {
    if (_commentController.text.trim().isEmpty) return;
    
    setState(() {
      comments.insert(0, IslamicComment(
        id: DateTime.now().toString(),
        author: 'You',
        username: 'your_username',
        content: _commentController.text.trim(),
        timestamp: DateTime.now(),
        reactions: 0,
        isReacted: false,
        profileColor: Colors.teal,
      ));
      _commentController.clear();
      _replyingTo = null;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your comment has been shared. Barakallahu feek!'),
        backgroundColor: Color(0xFF004D40),
      ),
    );
  }

  void _showCommentOptions(IslamicComment comment) {
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
              padding: EdgeInsets.all(16),
              child: Text(
                'Comment Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004D40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.flag, color: Colors.orange),
              title: Text('Report Comment'),
              onTap: () {
                Navigator.pop(context);
                // Handle report
              },
            ),
            ListTile(
              leading: Icon(Icons.block, color: Colors.red),
              title: Text('Block User'),
              onTap: () {
                Navigator.pop(context);
                // Handle block
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else {
      return '${difference.inDays}d';
    }
  }
}