import 'package:flutter/material.dart';
import 'package:tutorialsApp/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Learn All Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0XFF063970),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen());
  }
}
