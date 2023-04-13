import 'package:fatecflix_mobile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'FatecFlix';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}
