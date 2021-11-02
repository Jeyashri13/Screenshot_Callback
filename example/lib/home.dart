import 'dart:async';
import 'package:flutter/material.dart';
import 'package:screenshot_callback/screenshot_callback.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScreenshotCallback screenshotCallback;

  String text = "Ready..";
  DateTime time = DateTime.now();

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    await initScreenshotCallback();
  }

  //It must be created after permission is granted.
  Future<void> initScreenshotCallback() async {
    screenshotCallback = ScreenshotCallback();

    screenshotCallback.addListener(() {
      setState(() {
        time = DateTime.now();
        text = "Screenshot callback Fired!";
        print("$runtimeType page screenshoted at $time");
      });
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          text = "Ready..";
        });
      });
    });
  }

  @override
  void dispose() {
    screenshotCallback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detect Screenshot'),
        ),
        body: Center(
          child: Text(text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
//updated