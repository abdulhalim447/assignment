import 'package:assignment/Screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay before navigating to the main screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Customize the background color or other properties
      backgroundColor: Colors.blue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image covering the entire screen
          Image.asset(
            'assets/image/splash.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
