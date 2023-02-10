import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
    new AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSInitialize = new DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );

    var initializationsSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  }

  static Future showBigTextNotification(
      {var id = 0,
        required String title,
        required String body,
        var payload,
        required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    new AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',

      playSound: true,

      sound: RawResourceAndroidNotificationSound('notification'),

      /// sound can add Raw file located main-res-raw
      importance: Importance.max,
      priority: Priority.high,
    );

    DarwinNotificationDetails darwinNotificationDetails =
    new DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
      // sound: 'ddkwkwd.mp3'
    );

    var not = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: darwinNotificationDetails);
    await fln.show(0, title, body, not);
  }
}
