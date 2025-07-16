import 'package:flutter/material.dart';
import 'package:for_fajr/ui/screens/feed_screen.dart' hide NewPostScreen;
import 'package:for_fajr/ui/screens/login_screen.dart';
import 'package:for_fajr/ui/screens/new_post_screen.dart';
import 'package:for_fajr/ui/screens/post_list_screen.dart';
import 'package:for_fajr/ui/screens/sign_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  await Supabase.initialize(
    // TODO() : IMPORTANT!!! make this key and url private when committing to github
    url: 'https://ebzjdnzaicpulzxbvucl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImViempkbnphaWNwdWx6eGJ2dWNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIyMDI5NTksImV4cCI6MjA1Nzc3ODk1OX0.BBAwzNxfFFRsz7oqC1VAVyeS6PiM7VaPh1kzt14lbTc',
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

}

// Future<void> initPlatformState() async {
//   var status = await Permission.location.status;
//   if (await Permission.location.isDenied) {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.location,
//       // to be able to still get notifications when the app isn't running
//       Permission.locationAlways,
//       Permission.notification
//     ].request();
//     // print(statuses[Permission.location]);
//   }
//     // debugPrint('Initializing...');
//     await NativeGeofenceManager.instance.initialize();
//     // debugPrint('Initialization done');
//   }

class _MainAppState extends State<MainApp> {

  @override initState() {
    super.initState();
    // initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoorConnectApp(),
      initialRoute: '/sign-in',
      routes: {
        '/feed': (context) => NoorConnectApp(),
        '/login' : (context) => LoginScreen(),
        // '/comment' : (context) => CommentScreenV1(postId: '1', postAuthor: 'Sister Khadijah', postContent:  'SubhanAllah! This is such a beautiful reminder. May Allah reward you for sharing this beneficial content. Ameen! 🤲',),
        '/sign-in' : (context) => SignUpScreen(),
        '/post-list' : (context) => PostListScreen(),
        '/new-post' : (context) => NewPostScreen(),
        // '/new-comment' : (context) => NewCommentScreen(),
        // TODO(): add event list screen
        // TODO(): add event input screen
      },
      title: 'For Fajr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // hides the debug mode banner
    );
  }
}
