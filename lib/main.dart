import 'package:flutter/material.dart';
import 'package:push_notification/home.dart';

import 'local_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseApi().initNotification();
  await LocalNotification.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Push Notification',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
