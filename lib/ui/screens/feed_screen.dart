// void main() {
//   runApp(BarakahSocialApp());
// }

// class BarakahSocialApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Barakah Social',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         primaryColor: Color(0xFF1B5E20),
//         scaffoldBackgroundColor: Color(0xFF2E7D32),
//         fontFamily: 'Roboto',
//       ),
//       home: FeedScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class FeedScreen extends StatefulWidget {
//   @override
//   _FeedScreenState createState() => _FeedScreenState();
// }

// class _FeedScreenState extends State<FeedScreen> {
//   int _currentIndex = 0;
//   final TextEditingController _newPostController = TextEditingController();
//   bool _showCreatePost = false;
  
//   List<SocialPost> posts = [
//     SocialPost(
//       id: '1',
//       userName: 'Sister Zainab',
//       userHandle: '@zainab_deen',
//       content: 'Allahu Akbar! The beauty of tahajjud prayer cannot be described in words. The peace and tranquility it brings to the heart is beyond measure. May Allah grant us all the strength to wake up for night prayers regularly. 🤲',
//       timeAgo: '3m',
//       likes: 127,
//       reposts: 23,
//       comments: 41,
//       isLiked: false,
//       category: 'Spirituality',
//     ),
//     SocialPost(
//       id: '2',
//       userName: 'Brother Yusuf',
//       userHandle: '@yusuf_learns',
//       content: '"And it is He who created the heavens and earth in truth. And the day He says, \'Be,\' and it is, His word is the truth." - Quran 6:73\n\nSubhanAllah, reflecting on Allah\'s creative power fills me with awe every single day.',
//       timeAgo: '1h',
//       likes: 256,
//       reposts: 89,
//       comments: 67,
//       isLiked: true,
//       category: 'Quran',
//     ),
//     SocialPost(
//       id: '3',
//       userName: 'Imam Abdullah',
//       userHandle: '@imam_abdullah',
//       content: 'Reminder for our community: The mosque food drive is this Saturday after Maghrib prayer. Please bring non-perishable items to help our neighbors in need. Sadaqah never decreases wealth - Prophet Muhammad (PBUH). JazakAllahu khair!',
//       timeAgo: '2h',
//       likes: 189,
//       reposts: 156,
//       comments: 34,
//       isLiked: false,
//       category: 'Community',
//     ),
//     SocialPost(
//       id: '4',
//       userName: 'Muslimah Stories',
//       userHandle: '@muslimah_tales',
//       content: 'Today I helped an elderly woman carry her groceries. She made dua for me and my family. Sometimes the smallest acts of kindness bring the biggest barakah. Alhamdulillahi rabbil alameen! ✨',
//       timeAgo: '4h',
//       likes: 342,
//       reposts: 78,
//       comments: 92,
//       isLiked: true,
//       category: 'Inspiration',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF2E7D32),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom App Bar
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               decoration: BoxDecoration(
//                 color: Color(0xFF1B5E20),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25),
//                   bottomRight: Radius.circular(25),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Icon(Icons.star_half, color: Colors.white, size: 24),
//                   ),
//                   SizedBox(width: 12),
//                   Text(
//                     'Barakah Social',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       'Asr 3:45 PM',
//                       style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // Islamic Quote of the Day
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.95),
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                     offset: Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Icons.auto_awesome, color: Color(0xFF1B5E20), size: 20),
//                       SizedBox(width: 8),
//                       Text(
//                         'Daily Inspiration',
//                         style: TextStyle(
//                           color: Color(0xFF1B5E20),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     '"And whoever fears Allah - He will make for him a way out." - Quran 65:2',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontStyle: FontStyle.italic,
//                       color: Color(0xFF1B5E20),
//                       height: 1.4,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // Posts Feed
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xFFF1F8E9),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     // Create Post Button
//                     Container(
//                       margin: EdgeInsets.all(20),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _showCreatePost = !_showCreatePost;
//                           });
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                           decoration: BoxDecoration(
//                             color: Color(0xFF2E7D32),
//                             borderRadius: BorderRadius.circular(25),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 8,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(Icons.edit, color: Colors.white, size: 20),
//                               SizedBox(width: 12),
//                               Text(
//                                 'Share your thoughts with the Ummah...',
//                                 style: TextStyle(color: Colors.white.withOpacity(0.9)),
//                               ),
//                               Spacer(),
//                               Icon(Icons.add, color: Colors.white),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     // Create Post Expanded
//                     if (_showCreatePost)
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20),
//                         padding: EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 10,
//                               offset: Offset(0, 5),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             TextField(
//                               controller: _newPostController,
//                               maxLines: 4,
//                               decoration: InputDecoration(
//                                 hintText: 'What\'s on your mind? Share something beneficial...',
//                                 border: InputBorder.none,
//                                 hintStyle: TextStyle(color: Colors.grey[500]),
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                                       decoration: BoxDecoration(
//                                         color: Color(0xFF2E7D32).withOpacity(0.1),
//                                         borderRadius: BorderRadius.circular(15),
//                                       ),
//                                       child: Text(
//                                         '#Inspiration',
//                                         style: TextStyle(
//                                           color: Color(0xFF2E7D32),
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     TextButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           _showCreatePost = false;
//                                           _newPostController.clear();
//                                         });
//                                       },
//                                       child: Text('Cancel', style: TextStyle(color: Colors.grey)),
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         if (_newPostController.text.isNotEmpty) {
//                                           setState(() {
//                                             posts.insert(0, SocialPost(
//                                               id: DateTime.now().toString(),
//                                               userName: 'You',
//                                               userHandle: '@you',
//                                               content: _newPostController.text,
//                                               timeAgo: 'now',
//                                               likes: 0,
//                                               reposts: 0,
//                                               comments: 0,
//                                               isLiked: false,
//                                               category: 'Personal',
//                                             ));
//                                             _newPostController.clear();
//                                             _showCreatePost = false;
//                                           });
//                                         }
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Color(0xFF2E7D32),
//                                         foregroundColor: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(20),
//                                         ),
//                                       ),
//                                       child: Text('Post'),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),

//                     SizedBox(height: 10),

//                     // Posts List
//                     Expanded(
//                       child: ListView.builder(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         itemCount: posts.length,
//                         itemBuilder: (context, index) {
//                           return PostWidget(
//                             post: posts[index],
//                             onLike: () {
//                               setState(() {
//                                 posts[index].isLiked = !posts[index].isLiked;
//                                 posts[index].likes += posts[index].isLiked ? 1 : -1;
//                               });
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(25),
//             topRight: Radius.circular(25),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               offset: Offset(0, -5),
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           selectedItemColor: Color(0xFF2E7D32),
//           unselectedItemColor: Colors.grey[400],
//           selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Feed'),
//             BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
//             BottomNavigationBarItem(icon: Icon(Icons.access_time_filled), label: 'Salah'),
//             BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Learn'),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PostWidget extends StatelessWidget {
//   final SocialPost post;
//   final VoidCallback onLike;

//   PostWidget({required this.post, required this.onLike});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 20),
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // User Info
//           Row(
//             children: [
//               Container(
//                 width: 45,
//                 height: 45,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Center(
//                   child: Text(
//                     post.userName.split(' ').map((n) => n[0]).take(2).join().toUpperCase(),
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           post.userName,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Color(0xFF1B5E20),
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         Icon(Icons.verified, color: Color(0xFF2E7D32), size: 16),
//                       ],
//                     ),
//                     Text(
//                       '${post.userHandle} • ${post.timeAgo}',
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF2E7D32).withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   post.category,
//                   style: TextStyle(
//                     color: Color(0xFF2E7D32),
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           SizedBox(height: 15),

//           // Post Content
//           Text(
//             post.content,
//             style: TextStyle(
//               fontSize: 15,
//               height: 1.5,
//               color: Color(0xFF2C2C2C),
//             ),
//           ),

//           SizedBox(height: 20),

//           // Engagement Row
//           Row(
//             children: [
//               GestureDetector(
//                 onTap: onLike,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: post.isLiked ? Color(0xFF2E7D32).withOpacity(0.1) : Colors.grey[100],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         post.isLiked ? Icons.favorite : Icons.favorite_border,
//                         color: post.isLiked ? Color(0xFF2E7D32) : Colors.grey[600],
//                         size: 16,
//                       ),
//                       SizedBox(width: 4),
//                       Text(
//                         '${post.likes}',
//                         style: TextStyle(
//                           color: post.isLiked ? Color(0xFF2E7D32) : Colors.grey[600],
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
              
//               SizedBox(width: 12),
              
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.chat_bubble_outline, color: Colors.grey[600], size: 16),
//                     SizedBox(width: 4),
//                     Text(
//                       '${post.comments}',
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               SizedBox(width: 12),
              
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.repeat, color: Colors.grey[600], size: 16),
//                     SizedBox(width: 4),
//                     Text(
//                       '${post.reposts}',
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               Spacer(),
              
//               Icon(Icons.bookmark_border, color: Colors.grey[400], size: 20),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SocialPost {
//   final String id;
//   final String userName;
//   final String userHandle;
//   final String content;
//   final String timeAgo;
//   int likes;
//   final int reposts;
//   final int comments;
//   bool isLiked;
//   final String category;

//   SocialPost({
//     required this.id,
//     required this.userName,
//     required this.userHandle,
//     required this.content,
//     required this.timeAgo,
//     required this.likes,
//     required this.reposts,
//     required this.comments,
//     required this.isLiked,
//     required this.category,
//   });
// }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MuslimSocialApp());
// }

// class MuslimSocialApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ummah Connect',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         primaryColor: Color(0xFF2E7D32),
//         scaffoldBackgroundColor: Color(0xFFF5F5F5),
//         fontFamily: 'Roboto',
//       ),
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   final TextEditingController _postController = TextEditingController();
//   List<Post> posts = [
//     Post(
//       author: 'Ahmad Abdullah',
//       content: 'SubhanAllah! Just finished Fajr prayer and the sunrise is beautiful. Starting the day with gratitude. 🌅',
//       timestamp: '2 hours ago',
//       likes: 42,
//       comments: 8,
//     ),
//     Post(
//       author: 'Fatima Hassan',
//       content: 'Reminder: "And whoever relies upon Allah - then He is sufficient for him. Indeed, Allah will accomplish His purpose." - Quran 65:3',
//       timestamp: '4 hours ago',
//       likes: 89,
//       comments: 15,
//     ),
//     Post(
//       author: 'Omar Khan',
//       content: 'Alhamdulillah for another blessed day. May Allah grant us strength and guidance in all our endeavors. Ameen.',
//       timestamp: '6 hours ago',
//       likes: 56,
//       comments: 12,
//     ),
//     Post(
//       author: 'Aisha Mohamed',
//       content: 'Looking for Islamic book recommendations. Currently reading "The Sealed Nectar" - such an inspiring biography of Prophet Muhammad (PBUH).',
//       timestamp: '8 hours ago',
//       likes: 73,
//       comments: 24,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Icon(Icons.mosque, color: Colors.white),
//             SizedBox(width: 8),
//             Text('Ummah Connect', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           ],
//         ),
//         backgroundColor: Color(0xFF2E7D32),
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Prayer Time Bar
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//             color: Color(0xFF4CAF50),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Next Prayer: Dhuhr', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
//                 Text('12:45 PM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ),
          
//           // Post Creation Card
//           Container(
//             margin: EdgeInsets.all(16),
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 1,
//                   blurRadius: 5,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _postController,
//                   maxLines: 3,
//                   decoration: InputDecoration(
//                     hintText: 'Share your thoughts with the Ummah...',
//                     border: InputBorder.none,
//                     hintStyle: TextStyle(color: Colors.grey[600]),
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(Icons.mood, color: Colors.orange),
//                         SizedBox(width: 8),
//                         Icon(Icons.bookmark, color: Colors.blue),
//                       ],
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_postController.text.isNotEmpty) {
//                           setState(() {
//                             posts.insert(0, Post(
//                               author: 'You',
//                               content: _postController.text,
//                               timestamp: 'Just now',
//                               likes: 0,
//                               comments: 0,
//                             ));
//                             _postController.clear();
//                           });
//                         }
//                       },
//                       child: Text('Share'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF2E7D32),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
          
//           // Posts List
//           Expanded(
//             child: ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 return PostCard(post: posts[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Color(0xFF2E7D32),
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
//           BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Prayer'),
//           BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quran'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

// class PostCard extends StatefulWidget {
//   final Post post;

//   PostCard({required this.post});

//   @override
//   _PostCardState createState() => _PostCardState();
// }

// class _PostCardState extends State<PostCard> {
//   bool isLiked = false;
//   int likeCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     likeCount = widget.post.likes;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Author Info
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: Color(0xFF2E7D32),
//                 child: Text(
//                   widget.post.author[0],
//                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.post.author,
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     Text(
//                       widget.post.timestamp,
//                       style: TextStyle(color: Colors.grey[600], fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.more_vert, color: Colors.grey),
//                 onPressed: () {},
//               ),
//             ],
//           ),
          
//           SizedBox(height: 12),
          
//           // Post Content
//           Text(
//             widget.post.content,
//             style: TextStyle(fontSize: 15, height: 1.4),
//           ),
          
//           SizedBox(height: 16),
          
//           // Interaction Buttons
//           Row(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isLiked = !isLiked;
//                     likeCount += isLiked ? 1 : -1;
//                   });
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       isLiked ? Icons.favorite : Icons.favorite_border,
//                       color: isLiked ? Colors.red : Colors.grey[600],
//                       size: 20,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       '$likeCount',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ),
              
//               SizedBox(width: 24),
              
//               GestureDetector(
//                 onTap: () {},
//                 child: Row(
//                   children: [
//                     Icon(Icons.comment_outlined, color: Colors.grey[600], size: 20),
//                     SizedBox(width: 4),
//                     Text(
//                       '${widget.post.comments}',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ),
              
//               SizedBox(width: 24),
              
//               GestureDetector(
//                 onTap: () {},
//                 child: Icon(Icons.share_outlined, color: Colors.grey[600], size: 20),
//               ),
              
//               Spacer(),
              
//               GestureDetector(
//                 onTap: () {},
//                 child: Icon(Icons.bookmark_border, color: Colors.grey[600], size: 20),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Post {
//   final String author;
//   final String content;
//   final String timestamp;
//   final int likes;
//   final int comments;

//   Post({
//     required this.author,
//     required this.content,
//     required this.timestamp,
//     required this.likes,
//     required this.comments,
//   });
// }


// v 17

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MuslimSocialApp());
// }

// class MuslimSocialApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ummah Connect',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'serif',
//       ),
//       home: MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _currentIndex = 0;
//   bool _isDarkMode = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _currentIndex == 0 ? FeedScreen(isDarkMode: _isDarkMode) : Container(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Color(0xFF2A4A6B),
//         child: Icon(Icons.edit, color: Colors.white),
//         tooltip: 'Share your thoughts',
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF1A3B5C), Color(0xFF2C5F88)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) => setState(() => _currentIndex = index),
//           backgroundColor: Colors.transparent,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white54,
//           type: BottomNavigationBarType.fixed,
//           elevation: 0,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
//             BottomNavigationBarItem(icon: Icon(Icons.mosque), label: 'Prayer'),
//             BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quran'),
//             BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Ummah'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FeedScreen extends StatelessWidget {
//   final bool isDarkMode;
  
//   FeedScreen({this.isDarkMode = true});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF0F2A44), // Deeper Fajr blue
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Container(
//               padding: EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: Colors.white24,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(Icons.mosque, color: Colors.white, size: 20),
//             ),
//             SizedBox(width: 12),
//             Text('Ummah Connect', style: TextStyle(fontFamily: 'serif', fontWeight: FontWeight.w600)),
//           ],
//         ),
//         backgroundColor: Color(0xFF1A3B5C),
//         elevation: 0,
//         actions: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             margin: EdgeInsets.only(right: 8),
//             decoration: BoxDecoration(
//               color: Colors.white12,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.calendar_today, size: 12, color: Colors.white70),
//                 SizedBox(width: 4),
//                 Text('15 Rajab 1446', style: TextStyle(fontSize: 10, color: Colors.white70)),
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             margin: EdgeInsets.only(right: 12),
//             decoration: BoxDecoration(
//               color: Colors.white12,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Text('As-salamu alaykum', style: TextStyle(fontSize: 10, color: Colors.white70)),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF2A4A6B), Color(0xFF1A3B5C)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '🕌 Maghrib Prayer',
//                           style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           '6:42 PM • 28 minutes left',
//                           style: TextStyle(color: Colors.white70, fontSize: 13),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: Colors.white12,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         'Set Reminder',
//                         style: TextStyle(color: Colors.white, fontSize: 12),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Container(
//                   width: double.infinity,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: Colors.white24,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                   child: FractionallySizedBox(
//                     alignment: Alignment.centerLeft,
//                     widthFactor: 0.65,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white70,
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 6),
//                 Text(
//                   'May Allah accept our prayers and grant us steadfastness',
//                   style: TextStyle(color: Colors.white60, fontSize: 11, fontStyle: FontStyle.italic),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(12),
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF1A3B5C),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.white12),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.format_quote, color: Colors.white54, size: 20),
//                           SizedBox(width: 8),
//                           Text('Daily Reflection', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
//                           Spacer(),
//                           Icon(Icons.refresh, color: Colors.white54, size: 16),
//                         ],
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         '"And whoever relies upon Allah - then He is sufficient for him. Indeed, Allah will accomplish His purpose."',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white87,
//                           fontSize: 13,
//                           fontStyle: FontStyle.italic,
//                           height: 1.4,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '— Quran 65:3',
//                             style: TextStyle(color: Colors.white60, fontSize: 11),
//                           ),
//                           Row(
//                             children: [
//                               Icon(Icons.favorite_border, color: Colors.white54, size: 14),
//                               SizedBox(width: 4),
//                               Text('127', style: TextStyle(color: Colors.white54, fontSize: 11)),
//                               SizedBox(width: 12),
//                               Icon(Icons.share, color: Colors.white54, size: 14),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 PostCard(
//                   username: 'AhmadK',
//                   content: 'SubhanAllah, beautiful sunrise today. Alhamdulillah for another day. The morning light reminds me of Allah\'s mercy.',
//                   time: '5 min ago',
//                   likes: 24,
//                   location: 'Makkah, Saudi Arabia',
//                 ),
//                 PostCard(
//                   username: 'SarahM',
//                   content: 'Just finished reading Surah Al-Fatiha. "Guide us to the straight path" - such powerful words that touch the heart. May Allah guide us all.',
//                   time: '12 min ago',
//                   likes: 18,
//                   location: 'Istanbul, Turkey',
//                 ),
//                 PostCard(
//                   username: 'YusufA',
//                   content: 'Reminder: Maghrib prayer is in 30 minutes. "And establish prayer at the two ends of the day" - Quran 11:114. See you at the mosque, brothers!',
//                   time: '25 min ago',
//                   likes: 31,
//                   location: 'Cairo, Egypt',
//                 ),
//                 PostCard(
//                   username: 'FatimaH',
//                   content: 'Alhamdulillah, completed my Quran recitation today. The peace it brings to the heart is unmatched. Barakallahu feeki to all my sisters in faith.',
//                   time: '1 hour ago',
//                   likes: 42,
//                   location: 'Jakarta, Indonesia',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PostCard extends StatelessWidget {
//   final String username;
//   final String content;
//   final String time;
//   final int likes;
//   final String? location;

//   PostCard({required this.username, required this.content, required this.time, this.likes = 0, this.location});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       color: Color(0xFF1A3B5C),
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 44,
//                   height: 44,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFF4A6B8C), Color(0xFF2A4A6B)],
//                     ),
//                     borderRadius: BorderRadius.circular(22),
//                   ),
//                   child: Center(
//                     child: Text(
//                       username[0],
//                       style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         username,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                       if (location != null)
//                         Text(
//                           location!,
//                           style: TextStyle(color: Colors.white54, fontSize: 12),
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 14),
//             Text(
//               content,
//               style: TextStyle(color: Colors.white87, fontSize: 15, height: 1.5),
//             ),
//             SizedBox(height: 14),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   time,
//                   style: TextStyle(color: Colors.white54, fontSize: 12),
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.favorite_border, color: Colors.white54, size: 18),
//                     SizedBox(width: 6),
//                     Text('$likes', style: TextStyle(color: Colors.white54, fontSize: 13)),
//                     SizedBox(width: 16),
//                     Icon(Icons.comment_outlined, color: Colors.white54, size: 18),
//                     SizedBox(width: 6),
//                     Text('${(likes * 0.3).round()}', style: TextStyle(color: Colors.white54, fontSize: 13)),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



//////////////////////////////////////////////////
///

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MuslimSocialApp());
// }

// class MuslimSocialApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ummah Connect',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         primaryColor: Color(0xFF2E7D32),
//         scaffoldBackgroundColor: Color(0xFFF5F5F5),
//         fontFamily: 'Roboto',
//       ),
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   final TextEditingController _postController = TextEditingController();
//   List<Post> posts = [
//     Post(
//       author: 'Ahmad Abdullah',
//       content: 'SubhanAllah! Just finished Fajr prayer and the sunrise is beautiful. Starting the day with gratitude. 🌅',
//       timestamp: '2 hours ago',
//       likes: 42,
//       comments: 8,
//     ),
//     Post(
//       author: 'Fatima Hassan',
//       content: 'Reminder: "And whoever relies upon Allah - then He is sufficient for him. Indeed, Allah will accomplish His purpose." - Quran 65:3',
//       timestamp: '4 hours ago',
//       likes: 89,
//       comments: 15,
//     ),
//     Post(
//       author: 'Omar Khan',
//       content: 'Alhamdulillah for another blessed day. May Allah grant us strength and guidance in all our endeavors. Ameen.',
//       timestamp: '6 hours ago',
//       likes: 56,
//       comments: 12,
//     ),
//     Post(
//       author: 'Aisha Mohamed',
//       content: 'Looking for Islamic book recommendations. Currently reading "The Sealed Nectar" - such an inspiring biography of Prophet Muhammad (PBUH).',
//       timestamp: '8 hours ago',
//       likes: 73,
//       comments: 24,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Icon(Icons.mosque, color: Colors.white),
//             SizedBox(width: 8),
//             Text('Ummah Connect', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           ],
//         ),
//         backgroundColor: Color(0xFF2E7D32),
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Prayer Time Bar
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//             color: Color(0xFF4CAF50),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Next Prayer: Dhuhr', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
//                 Text('12:45 PM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ),
          
//           // Post Creation Card
//           Container(
//             margin: EdgeInsets.all(16),
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 1,
//                   blurRadius: 5,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _postController,
//                   maxLines: 3,
//                   decoration: InputDecoration(
//                     hintText: 'Share your thoughts with the Ummah...',
//                     border: InputBorder.none,
//                     hintStyle: TextStyle(color: Colors.grey[600]),
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(Icons.mood, color: Colors.orange),
//                         SizedBox(width: 8),
//                         Icon(Icons.bookmark, color: Colors.blue),
//                       ],
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_postController.text.isNotEmpty) {
//                           setState(() {
//                             posts.insert(0, Post(
//                               author: 'You',
//                               content: _postController.text,
//                               timestamp: 'Just now',
//                               likes: 0,
//                               comments: 0,
//                             ));
//                             _postController.clear();
//                           });
//                         }
//                       },
//                       child: Text('Share'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF2E7D32),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
          
//           // Posts List
//           Expanded(
//             child: ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 return PostCard(post: posts[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Color(0xFF2E7D32),
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
//           BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Prayer'),
//           BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quran'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

// class PostCard extends StatefulWidget {
//   final Post post;

//   PostCard({required this.post});

//   @override
//   _PostCardState createState() => _PostCardState();
// }

// class _PostCardState extends State<PostCard> {
//   bool isLiked = false;
//   int likeCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     likeCount = widget.post.likes;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Author Info
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: Color(0xFF2E7D32),
//                 child: Text(
//                   widget.post.author[0],
//                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.post.author,
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     Text(
//                       widget.post.timestamp,
//                       style: TextStyle(color: Colors.grey[600], fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.more_vert, color: Colors.grey),
//                 onPressed: () {},
//               ),
//             ],
//           ),
          
//           SizedBox(height: 12),
          
//           // Post Content
//           Text(
//             widget.post.content,
//             style: TextStyle(fontSize: 15, height: 1.4),
//           ),
          
//           SizedBox(height: 16),
          
//           // Interaction Buttons
//           Row(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isLiked = !isLiked;
//                     likeCount += isLiked ? 1 : -1;
//                   });
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       isLiked ? Icons.favorite : Icons.favorite_border,
//                       color: isLiked ? Colors.red : Colors.grey[600],
//                       size: 20,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       '$likeCount',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ),
              
//               SizedBox(width: 24),
              
//               GestureDetector(
//                 onTap: () {},
//                 child: Row(
//                   children: [
//                     Icon(Icons.comment_outlined, color: Colors.grey[600], size: 20),
//                     SizedBox(width: 4),
//                     Text(
//                       '${widget.post.comments}',
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ),
              
//               SizedBox(width: 24),
              
//               GestureDetector(
//                 onTap: () {},
//                 child: Icon(Icons.share_outlined, color: Colors.grey[600], size: 20),
//               ),
              
//               Spacer(),
              
//               GestureDetector(
//                 onTap: () {},
//                 child: Icon(Icons.bookmark_border, color: Colors.grey[600], size: 20),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Post {
//   final String author;
//   final String content;
//   final String timestamp;
//   final int likes;
//   final int comments;

//   Post({
//     required this.author,
//     required this.content,
//     required this.timestamp,
//     required this.likes,
//     required this.comments,
//   });
// }

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