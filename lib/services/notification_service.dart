import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final plugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await plugin.initialize(settings);
    await plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> showTestNotification() async {
    const details = AndroidNotificationDetails(
      'learner_channel',
      'Learner Notifications',
      channelDescription: 'Notifications for Learner App',
      importance: Importance.high,
      priority: Priority.high,
    );
    await plugin.show(
      1,
      'Learner App',
      'Test notification successfully triggered!',
      const NotificationDetails(android: details),
    );
  }
}
