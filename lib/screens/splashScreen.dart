import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tutorialsApp/screens/startScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(text: "Learn All\n", style: TextStyle(fontSize: 30)),
          TextSpan(
              text: "Quality Education",
              style: TextStyle(
                  fontSize: 15, color: Colors.white.withOpacity(0.75)))
        ]),
      )),
    );
  }
}
