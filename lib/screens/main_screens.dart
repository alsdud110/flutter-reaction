import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  static String routeName = "/main_screens";

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  late Stopwatch stopwatch;
  double _reactionTime = 0.0;
  Color _backgroundColor = Colors.red;
  bool isStarted = false;
  bool isNowCounting = false;
  String text = "";

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch()..start();
    _backgroundColor = Colors.red;
    _reactionTime = 0.0;
  }

  void _startTest() {
    setState(() {
      _backgroundColor = Colors.red;
      _reactionTime = 0.0;
      isStarted = true;
      isNowCounting = true;
      text = "Waiting For Green";
    });
    Timer(Duration(seconds: Random().nextInt(5) + 1), () {
      setState(() {
        isNowCounting = false;
        _backgroundColor = Colors.green;
        text = "Click!!!";
        stopwatch.reset();
        stopwatch.start();
      });
    });
  }

  void _handleTap() {
    if (_backgroundColor == Colors.green) {
      setState(() {
        _reactionTime = stopwatch.elapsedMilliseconds * 1.0;
        _backgroundColor = Colors.blue;
        stopwatch.reset();
        isStarted = false;
        isNowCounting = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _handleTap,
        child: Container(
          color: _backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      isStarted ? text : "$_reactionTime ms",
                      style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                isStarted
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          _startTest();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                "Start",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
