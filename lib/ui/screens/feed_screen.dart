import 'package:flutter/material.dart';

void main() {
  runApp(NoorConnectApp());
}

class NoorConnectApp extends StatelessWidget {
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
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004D40),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.auto_awesome,
                size: 60,
                color: Color(0xFF004D40),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Noor Connect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Connecting hearts through faith',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Main Screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    FeedScreen(),
    SearchScreen(),
    SavedScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
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
          onTap: _onItemTapped,
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
      ),
    );
  }
}

// Feed Screen (Your original code with minor modifications)
class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
  late TabController _tabController;
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
                        Color(0xFF0D1B2A),
                        Color(0xFF1B263B),
                        Color(0xFF415A77),
                        Color(0xFF778DA9),
                        Color(0xFF9A8C98),
                        Color(0xFFE9C46A),
                        Color(0xFFF4A261),
                        Color(0xFFE76F51),
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
            
            // Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTimelineFeed(),
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

// Search Screen
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> _trendingTopics = [
    '#Ramadan2024',
    '#IslamicQuotes',
    '#DuaOfTheDay',
    '#ProphetMuhammad',
    '#Sunnah',
    '#AlhamdulillahForEverything',
    '#SubhanAllah',
    '#Tawakkul',
    '#Patience',
    '#Gratitude',
  ];

  final List<String> _suggestedAccounts = [
    'Dr. Yasir Qadhi',
    'Nouman Ali Khan',
    'Mufti Menk',
    'Omar Suleiman',
    'Sh. Abdul Nasir Jangda',
    'Ustadha Ieasha Prime',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D40),
        elevation: 0,
        title: Text('Search', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: Color(0xFF004D40),
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search posts, people, topics...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_searchQuery.isEmpty) ...[
                    // Trending Topics
                    _buildSectionTitle('Trending Topics'),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _trendingTopics.map((topic) => _buildTopicChip(topic)).toList(),
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Suggested Accounts
                    _buildSectionTitle('Suggested Islamic Scholars'),
                    SizedBox(height: 12),
                    ..._suggestedAccounts.map((account) => _buildAccountTile(account)).toList(),
                  ] else ...[
                    // Search Results
                    _buildSectionTitle('Search Results'),
                    SizedBox(height: 12),
                    _buildSearchResults(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF004D40),
      ),
    );
  }

  Widget _buildTopicChip(String topic) {
    return GestureDetector(
      onTap: () {
        _searchController.text = topic;
        setState(() {
          _searchQuery = topic;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFF004D40).withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFF004D40).withOpacity(0.3)),
        ),
        child: Text(
          topic,
          style: TextStyle(
            color: Color(0xFF004D40),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTile(String name) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF004D40).withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                name.split(' ').map((n) => n[0]).take(2).join().toUpperCase(),
                style: TextStyle(
                  color: Color(0xFF004D40),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Islamic Scholar',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF004D40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text('Follow', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(Icons.search, size: 60, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'Searching for "$_searchQuery"',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Found 23+ posts and discussions',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

// Saved Screen
class SavedScreen extends StatelessWidget {
  final List<IslamicPost> savedPosts = [
    IslamicPost(
      id: 's1',
      author: 'Dr. Yusuf Ahmed',
      username: 'dr_yusuf',
      content: 'Beautiful reminder: "And whoever relies upon Allah - then He is sufficient for him. Indeed, Allah will accomplish His purpose." - Quran 65:3',
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      reactions: 567,
      shares: 234,
      discussions: 123,
      isReacted: true,
      profileColor: Colors.indigo,
    ),
    IslamicPost(
      id: 's2',
      author: 'Sister Aisha',
      username: 'aisha_reflections',
      content: 'The Prophet (ﷺ) said: "The believers in their mutual kindness, compassion, and sympathy are just one body - when a limb suffers, the whole body responds to it with wakefulness and fever." - Bukhari & Muslim',
      timestamp: DateTime.now().subtract(Duration(days: 5)),
      reactions: 445,
      shares: 178,
      discussions: 89,
      isReacted: true,
      profileColor: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D40),
        elevation: 0,
        title: Text('Saved Posts', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats Container
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Total Saved', '${savedPosts.length}', Icons.bookmark),
                Container(width: 1, height: 40, color: Colors.grey[300]),
                _buildStatItem('This Month', '12', Icons.calendar_today),
                Container(width: 1, height: 40, color: Colors.grey[300]),
              ],
            ),
          ),
          
          // Saved Posts List
          // TODO(): review and remove coloring on  ProfilePicture based on category label coloring
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: savedPosts.length,
              itemBuilder: (context, index) {
                return IslamicPostCard(
                  post: savedPosts[index],
                  onReact: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF004D40), size: 24),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004D40),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

}

// Notifications Screen
class NotificationsScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      id: '1',
      type: 'like',
      message: 'Hafiz Mahmoud and 23 others liked your post',
      timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      isRead: false,
      avatar: Colors.red,
    ),
    NotificationItem(
      id: '2',
      type: 'comment',
      message: 'Sister Maryam commented on your reflection',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      isRead: false,
      avatar: Colors.blue,
    ),
    NotificationItem(
      id: '3',
      type: 'follow',
      message: 'Dr. Yusuf Ahmed started following you',
      timestamp: DateTime.now().subtract(Duration(hours: 5)),
      isRead: true,
      avatar: Colors.green,
    ),
    NotificationItem(
      id: '4',
      type: 'share',
      message: 'Your hadith post was shared 15 times',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      isRead: true,
      avatar: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D40),
        elevation: 0,
        title: Text('Notifications', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.mark_email_read, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Summary Container
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF004D40), Color(0xFF00695C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.notifications, color: Colors.white),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have 2 unread notifications',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Stay connected with your community',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Notifications List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: notification.isRead ? Colors.white : Color(0xFFF1F8E9),
                    borderRadius: BorderRadius.circular(12),
                    border: notification.isRead ? null : Border.all(color: Color(0xFF004D40).withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: notification.avatar.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        _getNotificationIcon(notification.type),
                        color: notification.avatar,
                      ),
                    ),
                    title: Text(
                      notification.message,
                      style: TextStyle(
                        fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      _formatTimestamp(notification.timestamp),
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: !notification.isRead
                        ? Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Color(0xFF004D40),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'like':
        return Icons.favorite;
      case 'comment':
        return Icons.chat_bubble;
      case 'follow':
        return Icons.person_add;
      case 'share':
        return Icons.share;
      default:
        return Icons.notifications;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}

// Profile Screen
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 300,
                floating: false,
                pinned: true,
                backgroundColor: Color(0xFF004D40),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () => _showSettingsDialog(context),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF004D40),
                          Color(0xFF00695C),
                          Color(0xFF00796B),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: Center(
                            child: Text(
                              'YU',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Your Username',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@your_username',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Seeking knowledge and sharing beneficial content\n"And say: My Lord, increase me in knowledge" - Quran 20:114',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
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
              // Stats Row
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildProfileStat('Posts', '47'),
                    _buildProfileStat('Following', '234'),
                    _buildProfileStat('Followers', '1.2K'),
                    _buildProfileStat('Saved', '89'),
                  ],
                ),
              ),
              
              // Tab Bar
              Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFF004D40),
                  unselectedLabelColor: Colors.grey[600],
                  indicatorColor: Color(0xFF004D40),
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on), text: 'Posts'),
                    Tab(icon: Icon(Icons.favorite_border), text: 'Liked'),
                    Tab(icon: Icon(Icons.bookmark_border), text: 'Saved'),
                  ],
                ),
              ),
              
              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPostsGrid(),
                    _buildLikedPosts(),
                    _buildSavedPosts(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004D40),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFF004D40).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    index % 3 == 0 ? 'Reflection' : index % 3 == 1 ? 'Hadith' : 'Dua',
                    style: TextStyle(
                      color: Color(0xFF004D40),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Text(
                    _getPostContent(index),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('${23 + index}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(width: 12),
                    Icon(Icons.chat_bubble_outline, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('${5 + index}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getPostContent(int index) {
    final contents = [
      'Beautiful reminder about patience and trust in Allah\'s wisdom...',
      'The Prophet (peace be upon him) said: "The best of people are those who benefit others"',
      'Allahumma barik lana fi ma razaqtana...',
      'SubhanAllah, reflecting on Allah\'s beautiful creation...',
      'May Allah grant us strength in our daily prayers...',
      'Remembering the importance of gratitude in Islam...',
    ];
    return contents[index % contents.length];
  }

  Widget _buildLikedPosts() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 60, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'Your liked posts will appear here',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedPosts() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border, size: 60, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'Your saved posts will appear here',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Main Profile Options Widget
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Color? iconColor,
    Widget? trailing,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (iconColor ?? Color(0xFF004D40)).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor ?? Color(0xFF004D40),
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2C2C2C),
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                )
              : null,
          trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey[300],
            indent: 68,
            endIndent: 20,
          ),
      ],
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF004D40),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Row(
                children: [
                  Icon(Icons.settings, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'Settings',
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
            
            // Settings Options
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 12),
                children: [
                  // Profile Section
                  _buildProfileOption(
                    icon: Icons.person,
                    title: 'Edit Profile',
                    subtitle: 'Update your profile information',
                    onTap: () => _handleEditProfile(context),
                  ),
                  
                  _buildProfileOption(
                    icon: Icons.photo_camera,
                    title: 'Change Profile Picture',
                    subtitle: 'Update your profile photo',
                    onTap: () => _handleChangeProfilePicture(context),
                  ),
                  
                  // Notification Section
                  _buildProfileOption(
                    icon: Icons.notifications,
                    title: 'Notification Settings',
                    subtitle: 'Manage your notifications',
                    onTap: () => _handleNotificationSettings(context),
                  ),
                  
                  // Privacy Section
                  _buildProfileOption(
                    icon: Icons.privacy_tip,
                    title: 'Privacy Settings',
                    subtitle: 'Control your privacy preferences',
                    onTap: () => _handlePrivacySettings(context),
                  ),
                  
                  _buildProfileOption(
                    icon: Icons.block,
                    title: 'Blocked Users',
                    subtitle: 'Manage blocked accounts',
                    onTap: () => _handleBlockedUsers(context),
                  ),
                  
                  // Content Section
                  _buildProfileOption(
                    icon: Icons.bookmark,
                    title: 'Saved Posts',
                    subtitle: 'View your saved content',
                    onTap: () => _handleSavedPosts(context),
                  ),
                  
                  _buildProfileOption(
                    icon: Icons.download,
                    title: 'Download Data',
                    subtitle: 'Export your account data',
                    onTap: () => _handleDownloadData(context),
                  ),
                  
                  // App Settings
                  _buildProfileOption(
                    icon: Icons.dark_mode,
                    title: 'Dark Mode',
                    subtitle: 'Toggle dark theme',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) => _handleDarkMode(value),
                      activeColor: Color(0xFF004D40),
                    ),
                    onTap: () {},
                  ),
                  
                  _buildProfileOption(
                    icon: Icons.language,
                    title: 'Language',
                    subtitle: 'English',
                    onTap: () => _handleLanguage(context),
                  ),
                  
                  // Support Section
                  _buildProfileOption(
                    icon: Icons.help,
                    title: 'Help & Support',
                    subtitle: 'Get help and contact support',
                    onTap: () => _handleHelpSupport(context),
                  ),
                  
                  _buildProfileOption(
                    icon: Icons.bug_report,
                    title: 'Report a Bug',
                    subtitle: 'Help us improve the app',
                    onTap: () => _handleReportBug(context),
                  ),
                  
                  _buildProfileOption(
                    icon: Icons.star,
                    title: 'Rate the App',
                    subtitle: 'Share your feedback',
                    onTap: () => _handleRateApp(context),
                  ),
                  
                  // About Section
                  _buildProfileOption(
                    icon: Icons.info,
                    title: 'About',
                    subtitle: 'App version and information',
                    onTap: () => _handleAbout(context),
                  ),
                  
                  _buildProfileOption(
                    icon: Icons.description,
                    title: 'Terms of Service',
                    subtitle: 'Read our terms',
                    onTap: () => _handleTermsOfService(context),
                  ),
                  
                  _buildProfileOption(
                    icon: Icons.policy,
                    title: 'Privacy Policy',
                    subtitle: 'Read our privacy policy',
                    onTap: () => _handlePrivacyPolicy(context),
                  ),
                  
                  // Logout Section
                  _buildProfileOption(
                    icon: Icons.logout,
                    title: 'Logout',
                    subtitle: 'Sign out of your account',
                    iconColor: Colors.red,
                    onTap: () => _handleLogout(context),
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Handler methods for profile options
  void _handleEditProfile(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Edit Profile clicked');
  }

  void _handleChangeProfilePicture(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Change Profile Picture clicked');
  }

  void _handleNotificationSettings(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Notification Settings clicked');
  }

  void _handlePrivacySettings(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Privacy Settings clicked');
  }

  void _handleBlockedUsers(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Blocked Users clicked');
  }

  void _handleSavedPosts(BuildContext context) {
    Navigator.pop(context);
    _tabController.animateTo(2); // Navigate to saved posts tab
  }

  void _handleDownloadData(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Download Data clicked');
  }

  void _handleDarkMode(bool value) {
    _showSnackBar('Dark Mode ${value ? 'enabled' : 'disabled'}');
  }

  void _handleLanguage(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Language Settings clicked');
  }

  void _handleHelpSupport(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Help & Support clicked');
  }

  void _handleReportBug(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Report Bug clicked');
  }

  void _handleRateApp(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Rate App clicked');
  }

  void _handleAbout(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('About clicked');
  }

  void _handleTermsOfService(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Terms of Service clicked');
  }

  void _handlePrivacyPolicy(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar('Privacy Policy clicked');
  }

  void _handleLogout(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Logged out successfully');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Color(0xFF004D40),
      ),
    );
  }
}

// Islamic Post Card (Enhanced)
class IslamicPostCard extends StatefulWidget {
  final IslamicPost post;
  final VoidCallback onReact;

  IslamicPostCard({required this.post, required this.onReact});

  @override
  _IslamicPostCardState createState() => _IslamicPostCardState();
}

class _IslamicPostCardState extends State<IslamicPostCard> 
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
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
                          color: widget.post.profileColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: widget.post.profileColor.withOpacity(0.3)),
                        ),
                        child: Center(
                          child: Text(
                            widget.post.author.split(' ').map((n) => n[0]).take(2).join().toUpperCase(),
                            style: TextStyle(
                              color: widget.post.profileColor,
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
                                  widget.post.author,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF004D40),
                                  ),
                                ),
                                SizedBox(width: 6),
                              ],
                            ),
                            Text(
                              '@${widget.post.username} • ${_formatTimestamp(widget.post.timestamp)}',
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
                    widget.post.content,
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
                        icon: widget.post.isReacted ? Icons.favorite : Icons.favorite_border,
                        count: widget.post.reactions,
                        color: widget.post.isReacted ? Colors.red : Colors.grey[600]!,
                        onTap: () {
                          _animationController.forward().then((_) {
                            _animationController.reverse();
                          });
                          widget.onReact();
                        },
                      ),
                      SizedBox(width: 20),
                      _buildEngagementButton(
                        icon: Icons.chat_bubble_outline,
                        count: widget.post.discussions,
                        color: Colors.grey[600]!,
                        onTap: () {},
                      ),
                      SizedBox(width: 20),
                      _buildEngagementButton(
                        icon: Icons.share,
                        count: widget.post.shares,
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
          ),
        );
      },
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

// Data Models
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
    required this.profileColor,
  });
}

class NotificationItem {
  final String id;
  final String type;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final Color avatar;

  NotificationItem({
    required this.id,
    required this.type,
    required this.message,
    required this.timestamp,
    required this.isRead,
    required this.avatar,
  });
}