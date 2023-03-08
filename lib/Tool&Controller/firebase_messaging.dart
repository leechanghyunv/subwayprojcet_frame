import 'package:get/get.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  // FirebaseMessaging _messaging = FirebaseMessaging.instance;
  //
  // void onMessage() {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print('Got a message whilst in the foreground!');
  //     print('Message data: ${message.data}');
  //
  //     if (message.notification != null) {
  //       print('Message also contained a notification: ${message.notification}');
  //     }
  //   });
  // }
  //
  //
  // void _initNotification(){
  //   _messaging.requestPermission(
  //     sound: true,
  //     badge: true,
  //     alert: true,
  //     provisional: true,
  //   ) ;
  // }
  // @override
  // void onInit (){
  //   onMessage();
  //   _initNotification();
  //   _getToken();
  //   super.onInit();
  // }
  //
  //
  // Future<void> _getToken()async {
  //   try {
  //     String? token = await _messaging.getToken();
  //     print('Get token >>>>> ${token}');
  //   } catch(e) {
  //     print('fail to get Token');
  //   }
  // }



}