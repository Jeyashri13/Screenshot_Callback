import 'package:flutter/material.dart';

import 'package:screenshot_callback_example/home.dart';
import 'package:screenshot_callback_example/home2.dart';

//latest changes
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screenshot Callback',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home2(),
    );
  }
}
