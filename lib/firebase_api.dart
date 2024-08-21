import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification/local_notification.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  static final onClickNotification = BehaviorSubject<String>();
  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    onClickNotification.add("Title: ${message.notification?.title}");
  }

  Future<void> initNotification() async {
    _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("FirebaseCloud Messaging Token: $fcmToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      // [SHOW SIMPLE NOTIFICATION OF LOCAL NOTIFICATION] //
      LocalNotification.showSimpleNotification(
        title: notification.title!,
        body: notification.body!,
        payload: jsonEncode(message.toMap()),
      );
    });
  }
}
