import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:for_fajr/core/package_widgets/create_geofence.dart';
import 'package:native_geofence/native_geofence.dart';

void main() async => runApp(GeofenceScreen());

final zone1 = Geofence(
  id: 'zone1',
  location: Location(latitude: 40.75798, longitude: -73.98554), // Times Square
  radiusMeters: 500,
  triggers: {
    GeofenceEvent.enter,
    GeofenceEvent.exit,
    GeofenceEvent.dwell,
  },
  iosSettings: IosGeofenceSettings(
    initialTrigger: true,
  ),
  androidSettings: AndroidGeofenceSettings(
    initialTriggers: {GeofenceEvent.enter},
    expiration: const Duration(days: 7),
    loiteringDelay: const Duration(minutes: 5),
    notificationResponsiveness: const Duration(minutes: 5),
  ),
);



class GeofenceScreen extends StatefulWidget {
  @override
  _GeofenceScreenState createState() => _GeofenceScreenState();
}

class _GeofenceScreenState extends State<GeofenceScreen> {
  String geofenceState = 'N/A';
  ReceivePort port = ReceivePort();

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      'native_geofence_send_port',
    );
    port.listen((dynamic data) {
      debugPrint('Event: $data');
      setState(() {
        geofenceState = data;
      });
    });
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    debugPrint('Initializing...');
    await NativeGeofenceManager.instance.initialize();
    debugPrint('Initialization done');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Geofence'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Current state: $geofenceState'),
                const SizedBox(height: 20),
                // calling function on project github
                CreateGeofence(),
                ElevatedButton(
                onPressed: () async {
                  List<String> activeGeofences = [];
                  final List<ActiveGeofence> myGeofences = await NativeGeofenceManager.instance.getRegisteredGeofences();
                  final List<String> geofences = await NativeGeofenceManager.instance.getRegisteredGeofenceIds();
                  setState(() {
                    activeGeofences = geofences;
                  });
                  if (activeGeofences == GeofenceEvent.enter) {
                    print('Geofence enter is active');
                  }
                  print('There are ${myGeofences.length} active geofences.');
                },
                child: const Text('Print active geofences'),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

