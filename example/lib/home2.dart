import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot_callback/screenshot_callback.dart';

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  ScreenshotCallback screenshotCallback;

  String text = 'Ready..';
  DateTime time = DateTime.now();

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    await initScreenshotCallback();
  }

  Future<void> initScreenshotCallback() async {
    screenshotCallback = ScreenshotCallback();

    screenshotCallback.addListener(() {
      setState(() {
        time = DateTime.now();
        text = 'Screenshot callback Fired';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detect Screenshot2'),
      ),
      body: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
//changes