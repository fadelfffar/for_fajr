import 'package:flutter/material.dart';

// Comment Model
class IslamicComment {
  final String id;
  final String author;
  final String username;
  final String content;
  final DateTime timestamp;
  final int reactions;
  final bool isReacted;
  final Color profileColor;
  final String? parentId; // For threaded comments
  final List<IslamicComment> replies;
  final bool isVerified;

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
    this.replies = const [],
    this.isVerified = false,
  });
}

// Comment Screen
class CommentScreen extends StatefulWidget {
  final String postId;
  final String postAuthor;
  final String postContent;

  const CommentScreen({
    Key? key,
    required this.postId,
    required this.postAuthor,
    required this.postContent,
  }) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> with TickerProviderStateMixin {
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  
  bool _isReplying = false;
  String _replyingToId = '';
  String _replyingToUsername = '';
  
  List<IslamicComment> comments = [
    IslamicComment(
      id: '1',
      author: 'Sister Khadijah',
      username: 'khadijah_wisdom',
      content: 'SubhanAllah! This is such a beautiful reminder. May Allah reward you for sharing this beneficial content. Ameen! 🤲',
      timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      reactions: 45,
      isReacted: true,
      profileColor: Colors.purple,
      isVerified: true,
      replies: [
        IslamicComment(
          id: '1-1',
          author: 'Brother Ahmad',
          username: 'ahmad_seeker',
          content: 'Ameen ya rabb! Sister Khadijah, your comments always bring peace to my heart. Barakallahu feeki.',
          timestamp: DateTime.now().subtract(Duration(minutes: 25)),
          reactions: 12,
          isReacted: false,
          profileColor: Colors.blue,
          parentId: '1',
        ),
        IslamicComment(
          id: '1-2',
          author: 'Ustadh Ibrahim',
          username: 'ustadh_ibrahim',
          content: 'Indeed, the Prophet (ﷺ) said: "A good word is charity." Your words are truly a form of sadaqah.',
          timestamp: DateTime.now().subtract(Duration(minutes: 20)),
          reactions: 28,
          isReacted: true,
          profileColor: Colors.green,
          parentId: '1',
          isVerified: true,
        ),
      ],
    ),
    IslamicComment(
      id: '2',
      author: 'Hafiz Yusuf',
      username: 'hafiz_yusuf',
      content: 'Allahu Akbar! This brought tears to my eyes. Sometimes we need these gentle reminders of Allah\'s mercy. May we all be guided to the straight path.',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
      reactions: 67,
      isReacted: false,
      profileColor: Colors.orange,
      isVerified: true,
    ),
    IslamicComment(
      id: '3',
      author: 'Sister Fatima',
      username: 'fatima_faith',
      content: 'La hawla wa la quwwata illa billah. Your post reminded me of Surah Ash-Sharh - "And it is only with the remembrance of Allah that hearts can find rest." JazakAllahu khair for this beautiful share.',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      reactions: 89,
      isReacted: true,
      profileColor: Colors.pink,
      replies: [
        IslamicComment(
          id: '3-1',
          author: 'Brother Umar',
          username: 'umar_taqwa',
          content: 'MashAllah Sister Fatima, that verse connection is perfect! May Allah increase us all in knowledge and understanding.',
          timestamp: DateTime.now().subtract(Duration(hours: 1, minutes: 45)),
          reactions: 15,
          isReacted: true,
          profileColor: Colors.indigo,
          parentId: '3',
        ),
      ],
    ),
    IslamicComment(
      id: '4',
      author: 'Dr. Aisha',
      username: 'dr_aisha_islam',
      content: 'From a psychological perspective, this aligns beautifully with Islamic teachings on mental wellness. The combination of dhikr, dua, and community support creates a powerful foundation for emotional healing. Alhamdulillah for Islam\'s holistic approach to human wellbeing.',
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
      reactions: 156,
      isReacted: false,
      profileColor: Colors.teal,
      isVerified: true,
    ),
    IslamicComment(
      id: '5',
      author: 'Young Muslim',
      username: 'muslim_youth',
      content: 'As a young Muslim struggling with daily challenges, posts like this give me hope and strength. May Allah bless you and grant you Jannah for spreading positivity. 💚',
      timestamp: DateTime.now().subtract(Duration(hours: 4)),
      reactions: 234,
      isReacted: true,
      profileColor: Colors.red,
      replies: [
        IslamicComment(
          id: '5-1',
          author: 'Sister Mariam',
          username: 'mariam_guidance',
          content: 'May Allah make it easy for you, dear brother/sister. Remember, after every hardship comes ease. We\'re all here supporting each other, InshaAllah.',
          timestamp: DateTime.now().subtract(Duration(hours: 3, minutes: 30)),
          reactions: 45,
          isReacted: true,
          profileColor: Colors.deepOrange,
          parentId: '5',
        ),
        IslamicComment(
          id: '5-2',
          author: 'Brother Khalid',
          username: 'khalid_hope',
          content: 'Stay strong! "And whoever relies upon Allah - then He is sufficient for him. Indeed, Allah will accomplish His purpose." (Quran 65:3)',
          timestamp: DateTime.now().subtract(Duration(hours: 3, minutes: 15)),
          reactions: 78,
          isReacted: false,
          profileColor: Colors.brown,
          parentId: '5',
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D40),
        foregroundColor: Colors.white,
        title: Text('Comments'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _showShareOptions(),
          ),
          IconButton(
            icon: Icon(Icons.bookmark_outline),
            onPressed: () => _savePost(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Original Post Header
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFF004D40),
                        child: Icon(Icons.person, color: Colors.white, size: 20),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.postAuthor,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.verified, color: Color(0xFF004D40), size: 16),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              widget.postContent,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: Colors.grey[800],
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Icon(Icons.comment, color: Color(0xFF004D40), size: 16),
                      SizedBox(width: 4),
                      Text(
                        '${_getTotalCommentCount()} Comments',
                        style: TextStyle(
                          color: Color(0xFF004D40),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: Colors.grey[300]),
              ],
            ),
          ),
          
          // Comments List
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.only(top: 8),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return _buildCommentCard(comments[index]);
                },
              ),
            ),
          ),
          
          // Reply indicator
          if (_isReplying)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Color(0xFF004D40).withOpacity(0.1),
              child: Row(
                children: [
                  Icon(Icons.reply, color: Color(0xFF004D40), size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Replying to @$_replyingToUsername',
                    style: TextStyle(
                      color: Color(0xFF004D40),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => _cancelReply(),
                    child: Icon(Icons.close, color: Color(0xFF004D40), size: 20),
                  ),
                ],
              ),
            ),
          
          // Comment Input
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, color: Colors.white, size: 18),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: _isReplying 
                              ? 'Reply with kindness...' 
                              : 'Add a thoughtful comment...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: _submitComment,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFF004D40),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentCard(IslamicComment comment) {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        children: [
                          Text(
                            comment.author,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          if (comment.isVerified) ...[
                            SizedBox(width: 4),
                            Icon(Icons.verified, color: Color(0xFF004D40), size: 14),
                          ],
                          SizedBox(width: 8),
                          Text(
                            _formatTimestamp(comment.timestamp),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      _buildCommentText(comment.content),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _reactToComment(comment.id),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: comment.isReacted 
                                    ? Color(0xFF004D40).withOpacity(0.1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    comment.isReacted ? Icons.favorite : Icons.favorite_outline,
                                    color: comment.isReacted ? Color(0xFF004D40) : Colors.grey[600],
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    comment.reactions.toString(),
                                    style: TextStyle(
                                      color: comment.isReacted ? Color(0xFF004D40) : Colors.grey[600],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          GestureDetector(
                            onTap: () => _startReply(comment.id, comment.username),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.reply, color: Colors.grey[600], size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Reply',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Replies
          if (comment.replies.isNotEmpty)
            Column(
              children: comment.replies.map((reply) => _buildReplyCard(reply)).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildReplyCard(IslamicComment reply) {
    return Container(
      margin: EdgeInsets.only(left: 48, right: 16, bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: reply.profileColor,
            child: Text(
              reply.author[0].toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      reply.author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    if (reply.isVerified) ...[
                      SizedBox(width: 4),
                      Icon(Icons.verified, color: Color(0xFF004D40), size: 12),
                    ],
                    SizedBox(width: 8),
                    Text(
                      _formatTimestamp(reply.timestamp),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  reply.content,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _reactToComment(reply.id),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            reply.isReacted ? Icons.favorite : Icons.favorite_outline,
                            color: reply.isReacted ? Color(0xFF004D40) : Colors.grey[600],
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            reply.reactions.toString(),
                            style: TextStyle(
                              color: reply.isReacted ? Color(0xFF004D40) : Colors.grey[600],
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => _startReply(reply.parentId!, reply.username),
                      child: Text(
                        'Reply',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
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

  void _submitComment() {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      if (_isReplying) {
        // Add reply to existing comment with @username prefix
        final parentIndex = comments.indexWhere((c) => c.id == _replyingToId);
        if (parentIndex != -1) {
          String replyContent = _commentController.text;
          // Ensure the reply starts with @username if not already present
          if (!replyContent.startsWith('@$_replyingToUsername')) {
            replyContent = '@$_replyingToUsername $replyContent';
          }
          
          comments[parentIndex].replies.add(
            IslamicComment(
              id: '${_replyingToId}-${DateTime.now().millisecondsSinceEpoch}',
              author: 'You',
              username: 'your_username',
              content: replyContent,
              timestamp: DateTime.now(),
              reactions: 0,
              isReacted: false,
              profileColor: Colors.teal,
              parentId: _replyingToId,
            ),
          );
        }
      } else {
        // Add new comment
        comments.insert(0, IslamicComment(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          author: 'You',
          username: 'your_username',
          content: _commentController.text,
          timestamp: DateTime.now(),
          reactions: 0,
          isReacted: false,
          profileColor: Colors.teal,
        ));
      }
      
      _commentController.clear();
      _isReplying = false;
      _replyingToId = '';
      _replyingToUsername = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Comment posted! May Allah reward your beneficial words.'),
        backgroundColor: Color(0xFF004D40),
      ),
    );
  }

  void _reactToComment(String commentId) {
    setState(() {
      // Find and update main comment
      final commentIndex = comments.indexWhere((c) => c.id == commentId);
      if (commentIndex != -1) {
        final comment = comments[commentIndex];
        comments[commentIndex] = IslamicComment(
          id: comment.id,
          author: comment.author,
          username: comment.username,
          content: comment.content,
          timestamp: comment.timestamp,
          reactions: comment.reactions + (comment.isReacted ? -1 : 1),
          isReacted: !comment.isReacted,
          profileColor: comment.profileColor,
          parentId: comment.parentId,
          replies: comment.replies,
          isVerified: comment.isVerified,
        );
        return;
      }

      // Find and update reply
      for (int i = 0; i < comments.length; i++) {
        final replyIndex = comments[i].replies.indexWhere((r) => r.id == commentId);
        if (replyIndex != -1) {
          final reply = comments[i].replies[replyIndex];
          comments[i].replies[replyIndex] = IslamicComment(
            id: reply.id,
            author: reply.author,
            username: reply.username,
            content: reply.content,
            timestamp: reply.timestamp,
            reactions: reply.reactions + (reply.isReacted ? -1 : 1),
            isReacted: !reply.isReacted,
            profileColor: reply.profileColor,
            parentId: reply.parentId,
            isVerified: reply.isVerified,
          );
          break;
        }
      }
    });
  }

  void _startReply(String commentId, String username) {
    setState(() {
      _isReplying = true;
      _replyingToId = commentId;
      _replyingToUsername = username;
      // Automatically add @username to the comment box
      _commentController.text = '@$username ';
      _commentController.selection = TextSelection.fromPosition(
        TextPosition(offset: _commentController.text.length),
      );
    });
    
    // Focus on text field after a short delay
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  void _cancelReply() {
    setState(() {
      _isReplying = false;
      _replyingToId = '';
      _replyingToUsername = '';
      _commentController.clear(); // Clear the @username when canceling
    });
  }

  void _showShareOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              'Share this beneficial content',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004D40),
              ),
            ),
            SizedBox(height: 20),
            _buildShareOption(Icons.copy, 'Copy Link', 'Share the link with others'),
            _buildShareOption(Icons.message, 'Send Message', 'Share via messaging app'),
            _buildShareOption(Icons.bookmark, 'Save for Later', 'Add to your saved posts'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFF004D40).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Color(0xFF004D40)),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title - Feature coming soon, InshaAllah!'),
            backgroundColor: Color(0xFF004D40),
          ),
        );
      },
    );
  }

  void _savePost() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Post saved! You can find it in your saved collection.'),
        backgroundColor: Color(0xFF004D40),
        action: SnackBarAction(
          label: 'View',
          textColor: Colors.white,
          onPressed: () {
            // Navigate to saved posts
          },
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  int _getTotalCommentCount() {
    int total = comments.length;
    for (var comment in comments) {
      total += comment.replies.length;
    }
    return total;
  }

  Widget _buildCommentText(String content) {
    // Split content by words to identify @mentions
    final words = content.split(' ');
    List<TextSpan> spans = [];
    
    for (int i = 0; i < words.length; i++) {
      final word = words[i];
      if (word.startsWith('@') && word.length > 1) {
        // This is a mention - style it differently
        spans.add(TextSpan(
          text: word,
          style: TextStyle(
            fontSize: 14,
            height: 1.4,
            color: Color(0xFF004D40),
            fontWeight: FontWeight.w600,
          ),
        ));
      } else {
        // Regular text
        spans.add(TextSpan(
          text: word,
          style: TextStyle(
            fontSize: 14,
            height: 1.4,
            color: Colors.grey[800],
          ),
        ));
      }
      
      // Add space between words except for the last word
      if (i < words.length - 1) {
        spans.add(TextSpan(
          text: ' ',
          style: TextStyle(
            fontSize: 14,
            height: 1.4,
            color: Colors.grey[800],
          ),
        ));
      }
    }
    
    return RichText(
      text: TextSpan(children: spans),
    );
  }
}