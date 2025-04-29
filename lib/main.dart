import 'package:flutter/material.dart';
import 'package:for_fajr/core/geofence_screen.dart';
import 'package:for_fajr/ui/screens/comment_list_screen.dart';
import 'package:for_fajr/ui/screens/login_screen.dart';
import 'package:for_fajr/ui/screens/masjid_list_screen.dart';
import 'package:for_fajr/ui/screens/new_masjid_input_screen.dart';
import 'package:for_fajr/ui/screens/new_post_screen.dart';
import 'package:for_fajr/ui/screens/post_list_screen.dart';
import 'package:for_fajr/ui/screens/sign_up_screen.dart';
import 'package:native_geofence/native_geofence.dart';
import 'package:permission_handler/permission_handler.dart';
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

Future<void> initPlatformState() async {
  var status = await Permission.location.status;
  if (await Permission.location.isDenied) {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      // to be able to still get notifications when the app isn't running
      Permission.locationAlways,
      Permission.notification
    ].request();
    // print(statuses[Permission.location]);
  }
    // debugPrint('Initializing...');
    await NativeGeofenceManager.instance.initialize();
    // debugPrint('Initialization done');
  }

class _MainAppState extends State<MainApp> {

  @override initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MasjidListScreen(),
      initialRoute: '/post-list',
      routes: {
        '/geofence': (context) => GeofenceScreen(),
        '/masjid-list': (context) => MasjidListScreen(),
        '/new-masjid': (context) => NewMasjidInputScreen(),
        '/login' : (context) => LoginScreen(),
        '/sign-up' : (context) => SignUpScreen(),
        '/post-list' : (context) => PostListScreen(),
        '/new-post' : (context) => NewPostScreen(),
        '/comment-list': (context) => CommentListScreen(),
      },
      title: 'For Fajr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // hides the debug mode banner
    );
  }
}
