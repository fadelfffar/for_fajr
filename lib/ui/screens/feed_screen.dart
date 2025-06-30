import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noor Connect',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color(0xFF004D40),
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: MainFeedScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MainFeedScreen extends StatefulWidget {
  @override
  _MainFeedScreenState createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends State<MainFeedScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  final TextEditingController _thoughtController = TextEditingController();
  final TextEditingController _newPostController = TextEditingController();
  bool _showCreatePost = false;
  
  List<IslamicPost> allPosts = [
    IslamicPost(
      id: '1',
      author: 'Hafiz Mahmoud',
      username: 'hafiz_mahmoud',
      content: 'La hawla wa la quwwata illa billah - There is no power except with Allah. When life gets overwhelming, remember that Allah is always in control. Trust His wisdom and timing. 🤲',
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
      reactions: 234,
      shares: 45,
      discussions: 67,
      isReacted: false,
      postType: 'Dhikr',
      profileColor: Colors.deepPurple,
    ),
    IslamicPost(
      id: '2',
      author: 'Sister Maryam',
      username: 'maryam_guidance',
      content: 'Just finished reading Surah Al-Mulk before sleeping. The peace it brings to the heart is indescribable. May Allah protect us all through the night and grant us forgiveness. SubhanAllah for the blessing of the Quran! 📖✨',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
      reactions: 189,
      shares: 78,
      discussions: 34,
      isReacted: true,
      postType: 'Reflection',
      profileColor: Colors.pink,
    ),
    IslamicPost(
      id: '3',
      author: 'Dr. Yusuf Ahmed',
      username: 'dr_yusuf',
      content: 'Reminder: "Whoever believes in Allah and the Last Day, let him speak good or remain silent." - Prophet Muhammad (ﷺ)\n\nIn our digital age, this hadith is more relevant than ever. Let\'s use our words to spread light, not darkness.',
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
      reactions: 456,
      shares: 123,
      discussions: 89,
      isReacted: false,
      postType: 'Hadith',
      profileColor: Colors.indigo,
    ),
    IslamicPost(
      id: '4',
      author: 'Ustadh Bilal',
      username: 'ustadh_bilal',
      content: 'Alhamdulillahi rabbil alameen! Our weekend Islamic study circle was amazing. We discussed the concept of Tawakkul (trust in Allah). Remember: Plan, work hard, then trust Allah with the results. He knows what\'s best for us.',
      timestamp: DateTime.now().subtract(Duration(hours: 5)),
      reactions: 312,
      shares: 97,
      discussions: 156,
      isReacted: true,
      postType: 'Learning',
      profileColor: Colors.green,
    ),
    IslamicPost(
      id: '5',
      author: 'Muslimah Diary',
      username: 'muslimah_stories',
      content: 'Today I made dua for someone who hurt me. At first it felt difficult, but then I remembered how much Allah loves those who forgive. Forgiveness is a gift we give ourselves. May Allah soften all our hearts. 💚',
      timestamp: DateTime.now().subtract(Duration(hours: 8)),
      reactions: 278,
      shares: 62,
      discussions: 103,
      isReacted: false,
      postType: 'Personal',
      profileColor: Colors.orange,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _newPostController.dispose();
    _thoughtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              backgroundColor: Color(0xFF004D40),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0D1B2A), // Deep night blue
                        Color(0xFF1B263B), // Navy blue
                        Color(0xFF415A77), // Steel blue
                        Color(0xFF778DA9), // Light steel blue
                        Color(0xFF9A8C98), // Mauve
                        Color(0xFFE9C46A), // Golden yellow (sun emerging)
                        Color(0xFFF4A261), // Orange
                        Color(0xFFE76F51), // Coral (dawn colors)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'For Fajr',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Start fresh everyday with new Allah blessing',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            // Create Post Section
            Container(
              color: Color(0xFFF1F8E9),
              child: Column(
                children: [
                  // Create Post Expanded
                  if (_showCreatePost)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _newPostController,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: 'What\'s on your mind? Share something beneficial...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF004D40).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      '#Inspiration',
                                      style: TextStyle(
                                        color: Color(0xFF004D40),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _showCreatePost = false;
                                        _newPostController.clear();
                                      });
                                    },
                                    child: Text('Cancel', style: TextStyle(color: Colors.grey)),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_newPostController.text.isNotEmpty) {
                                        setState(() {
                                          allPosts.insert(0, IslamicPost(
                                            id: DateTime.now().toString(),
                                            author: 'You',
                                            username: 'your_username',
                                            content: _newPostController.text,
                                            timestamp: DateTime.now(),
                                            reactions: 0,
                                            shares: 0,
                                            discussions: 0,
                                            isReacted: false,
                                            postType: 'Personal',
                                            profileColor: Colors.teal,
                                          ));
                                          _newPostController.clear();
                                          _showCreatePost = false;
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Your thought has been shared! Barakallahu feeki.'),
                                            backgroundColor: Color(0xFF004D40),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF004D40),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text('Post'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  
                  // Create Post Button
                  Container(
                    margin: EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showCreatePost = !_showCreatePost;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Color(0xFF004D40),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: Colors.white, size: 20),
                            SizedBox(width: 12),
                            Text(
                              'Share your thoughts with the Ummah...',
                              style: TextStyle(color: Colors.white.withOpacity(0.9)),
                            ),
                            Spacer(),
                            Icon(_showCreatePost ? Icons.keyboard_arrow_up : Icons.add, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Tab Bar
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: Color(0xFF004D40),
                unselectedLabelColor: Colors.grey[600],
                indicatorColor: Color(0xFF004D40),
                indicatorWeight: 3,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                tabs: [
                  Tab(text: 'Timeline'),
                  Tab(text: 'Quran'),
                  Tab(text: 'Hadith'),
                  Tab(text: 'Community'),
                  Tab(text: 'Dhikr'),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTimelineFeed(),
                  _buildCategoryFeed('Quran'),
                  _buildCategoryFeed('Hadith'),
                  _buildCategoryFeed('Learning'),
                  _buildCategoryFeed('Dhikr'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showPostDialog(),
        backgroundColor: Color(0xFF004D40),
        foregroundColor: Colors.white,
        icon: Icon(Icons.create),
        label: Text('Share'),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTimelineFeed() {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        setState(() {});
      },
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: allPosts.length,
        itemBuilder: (context, index) {
          return IslamicPostCard(
            post: allPosts[index],
            onReact: () {
              setState(() {
                allPosts[index].isReacted = !allPosts[index].isReacted;
                allPosts[index].reactions += allPosts[index].isReacted ? 1 : -1;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryFeed(String category) {
    final filteredPosts = allPosts.where((post) => post.postType == category).toList();
    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        return IslamicPostCard(
          post: filteredPosts[index],
          onReact: () {
            setState(() {
              filteredPosts[index].isReacted = !filteredPosts[index].isReacted;
              filteredPosts[index].reactions += filteredPosts[index].isReacted ? 1 : -1;
            });
          },
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Color(0xFF004D40),
        unselectedItemColor: Colors.grey[400],
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _showPostDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF004D40),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Row(
                children: [
                  Icon(Icons.create, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'Share Your Thoughts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _thoughtController,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Share something beneficial with the Ummah...\n\nRemember: "Whoever guides someone to good will have a reward like one who did it." - Prophet Muhammad (ﷺ)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xFF004D40)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_thoughtController.text.isNotEmpty) {
                                setState(() {
                                  allPosts.insert(0, IslamicPost(
                                    id: DateTime.now().toString(),
                                    author: 'You',
                                    username: 'your_username',
                                    content: _thoughtController.text,
                                    timestamp: DateTime.now(),
                                    reactions: 0,
                                    shares: 0,
                                    discussions: 0,
                                    isReacted: false,
                                    postType: 'Personal',
                                    profileColor: Colors.teal,
                                  ));
                                  _thoughtController.clear();
                                });
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Your thought has been shared! Barakallahu feeki.'),
                                    backgroundColor: Color(0xFF004D40),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF004D40),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Share with Ummah',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IslamicPostCard extends StatelessWidget {
  final IslamicPost post;
  final VoidCallback onReact;

  IslamicPostCard({required this.post, required this.onReact});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: post.profileColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: post.profileColor.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Text(
                      post.author.split(' ').map((n) => n[0]).take(2).join().toUpperCase(),
                      style: TextStyle(
                        color: post.profileColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
                            post.author,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF004D40),
                            ),
                          ),
                          SizedBox(width: 6),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: post.profileColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              post.postType,
                              style: TextStyle(
                                color: post.profileColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '@${post.username} • ${_formatTimestamp(post.timestamp)}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert, color: Colors.grey[400]),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              post.content,
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Color(0xFF2C2C2C),
              ),
            ),
          ),
          
          SizedBox(height: 16),
          
          // Engagement
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                _buildEngagementButton(
                  icon: post.isReacted ? Icons.favorite : Icons.favorite_border,
                  count: post.reactions,
                  color: post.isReacted ? Colors.red : Colors.grey[600]!,
                  onTap: onReact,
                ),
                SizedBox(width: 20),
                _buildEngagementButton(
                  icon: Icons.chat_bubble_outline,
                  count: post.discussions,
                  color: Colors.grey[600]!,
                  onTap: () {},
                ),
                SizedBox(width: 20),
                _buildEngagementButton(
                  icon: Icons.share,
                  count: post.shares,
                  color: Colors.grey[600]!,
                  onTap: () {},
                ),
                Spacer(),
                Icon(Icons.bookmark_border, color: Colors.grey[400], size: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEngagementButton({
    required IconData icon,
    required int count,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 6),
          Text(
            count.toString(),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
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

class IslamicPost {
  final String id;
  final String author;
  final String username;
  final String content;
  final DateTime timestamp;
  int reactions;
  final int shares;
  final int discussions;
  bool isReacted;
  final String postType;
  final Color profileColor;

  IslamicPost({
    required this.id,
    required this.author,
    required this.username,
    required this.content,
    required this.timestamp,
    required this.reactions,
    required this.shares,
    required this.discussions,
    required this.isReacted,
    required this.postType,
    required this.profileColor,
  });
}