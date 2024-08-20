// import 'dart:convert';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   final androidChannel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Important Notifications',
//     description: "This channel is used for important notification.",
//     importance: Importance.high,
//   );
//
//   final localNotifications = FlutterLocalNotificationsPlugin();
//
//   Future<void> handleBackgroundMessage(RemoteMessage message) async {
//     print("Title: ${message.notification?.title}");
//     print("Body: ${message.notification?.body}");
//     print('PayLoad: ${message.data}');
//   }
//
//   Future<void> initNotification() async {
//     _firebaseMessaging.requestPermission();
//     final fcmToken = await _firebaseMessaging.getToken();
//     print("FirebaseCloud Messaging Token: $fcmToken");
//
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//
//     initPushNotifications();
//   }
//
//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;
//   }
//
//   Future initPushNotifications() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     FirebaseMessaging.onMessage.listen((message) {
//       final notification = message.notification;
//       if (notification == null) return;
//       localNotifications.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             androidChannel.id,
//             androidChannel.name,
//             channelDescription: androidChannel.description,
//             icon: '@drawable/ic_launcher',
//           ),
//         ),
//         payload: jsonEncode(message.toMap()),
//       );
//     });
//   }
//
//   Future initLocalNotifications() async {
//     const android = AndroidInitializationSettings('@drawable/ic_launcher');
//     const settings = InitializationSettings(android: android);
//     await localNotifications.initialize(settings);
//   }
// }
