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
    listenToNotification();
    super.initState();
  }

  listenToNotification() {
    LocalNotification.onClickNotification.stream.listen((event) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnotherPage(payload: event),
        ),
      );
    });
    // FirebaseApi.onClickNotification.stream.listen((event) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => AnotherPage(payload: event),
    //     ),
    //   );
    // });
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
            child: const Text("Cancel all"),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //mage.asset("assets/random.png"),
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
              onPressed: () async {
                await LocalNotification.showPeriodicNotification(
                    title: "Periodic Notification",
                    body: "This is a periodic notification body",
                    payload: "This is a data",
                    bigText:
                        "I'm glad to hear that you solved the problem by adding the necessary <receiver> tags in the AndroidManifest.xml file! These lines ensure that your app can handle scheduled notifications, including when the device is rebooted or updated. If you run into any more issues or have further questions, feel free to ask!");
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
