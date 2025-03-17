import 'package:flutter/material.dart';
import 'package:for_fajr/core/geofence_screen.dart';
import 'package:for_fajr/core/notification/notification_service.dart';
import 'package:native_geofence/native_geofence.dart';
import 'package:permission_handler/permission_handler.dart';

// add async for NativeGeofence
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().initNotification();
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
      home: GeofenceScreen(),
      title: 'For Fajr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // hides the debug mode banner
    );
  }
}
