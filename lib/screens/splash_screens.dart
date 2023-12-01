import 'package:flutter/material.dart';
import 'package:reaction_flutter/screens/main_screens.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => _completeSplash(context, const MainScreens()),
              child: Container(
                color: Colors.amber[600],
                child: const Center(
                  child: Text(
                    "시작할래~?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _completeSplash(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
