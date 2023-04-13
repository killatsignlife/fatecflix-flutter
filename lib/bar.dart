import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  static const String _title = 'FatecFlix';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: AppBar(
        title: const Text(_title), 
        backgroundColor: Colors.red,
      ),
    );
  }
}