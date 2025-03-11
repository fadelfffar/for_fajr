import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  int randomId = Random().nextInt(1000);

  // Initialization
  Future<void> initNotification() async {
    if (_isInitialized) return; // prevent re-initialization

  // prepare android initialization
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

  // prepare iOS initialization
  const initSettingsIOs = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  // init settings
  const initializationSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOs,
  );

  // finally initialize the plugin
  await notificationPlugin.initialize(initializationSettings);

  }
  // Notification Detail Setup
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'adzan_sound',
        'Daily Notification',
        channelDescription: 'Daily Notification Channel Description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        // IMPORTANT : add this icon declaration for notification initalization safety :)
        icon: '@mipmap/ic_launcher'
        ),
      iOS: DarwinNotificationDetails(),
    );
  }
  

  // Show Notification
  Future<void> showNotification({
    id = 0,
    String? title,
    String? body
  }) async {
    notificationPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id $randomId',
          'your channel name',
          channelDescription: 'your channel description',
          // playSound: true,
          // sound: RawResourceAndroidNotificationSound('adzan_alaqsha')
          ),
      ),
    );
  }

  // Show Scheduled Notification
  void showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    required String scheduledTime,
  }) async {
    await notificationPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.parse(tz.local, scheduledTime).subtract(const Duration(minutes: 30)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id $randomId', 'your channel name',
          channelDescription: 'your channel description',
          priority: Priority.high,
          importance: Importance.high,
          // playSound: true,
          // sound: RawResourceAndroidNotificationSound('res/raw/adzan_alaqsha')
          ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time
    );
    // Print scheduledTime to log
    stderr.writeln('scheduled time : ${scheduledTime}');
    developer.log("scheduled time : ${scheduledTime}");
  }

  // cancel all scheduled notifications
  void cancelAllNotifications () async {
    await notificationPlugin.cancelAll();
  }
}