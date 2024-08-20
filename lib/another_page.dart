import 'package:flutter/material.dart';

class AnotherPage extends StatefulWidget {
  final String payload;
  const AnotherPage({super.key, required this.payload});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.payload),
      ),
    );
  }
}
