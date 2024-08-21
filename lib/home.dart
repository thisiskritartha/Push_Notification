import 'package:flutter/material.dart';
import 'package:push_notification/local_notification.dart';

import 'another_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    listenToNotification();
    super.initState();
  }

  listenToNotification() {
    LocalNotification.onClickNotification.stream
      ..listen((event) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ocntext) => AnotherPage(payload: event),
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Local Notification"),
        actions: [
          TextButton(
            onPressed: () {
              LocalNotification.cancelAll();
            },
            child: Text("Cancel all"),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                LocalNotification.showSimpleNotification(
                  title: "Simple Notification",
                  body: "This is notification body",
                  payload: "This is a data",
                );
              },
              icon: const Icon(Icons.notifications_outlined),
              label: const Text("Simple Notification"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                print('Periodic Notification called');
                LocalNotification.showPeriodicNotification(
                  title: "Periodic Notification",
                  body: "This is a periodic notification body",
                  payload: "This is a data",
                );
              },
              icon: const Icon(Icons.timer_outlined),
              label: const Text("Periodic Notification"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                LocalNotification.showScheduleNotification(
                  title: "Schedule Notification",
                  body: "This is schedule notification",
                  payload: "This is data payload.",
                );
              },
              icon: const Icon(Icons.timer_outlined),
              label: const Text("Schedule Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
