import 'package:fatecflix_mobile/components/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fatecflix_mobile/components/login/login.dart';

void main() {
  runApp(const MaterialApp(
    home : LoginWidget()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'FatecFlix';

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}
