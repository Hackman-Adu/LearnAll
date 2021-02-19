import 'package:flutter/material.dart';

class LearnLanguages extends StatefulWidget {
  final String selectedLanguage;

  LearnLanguages({this.selectedLanguage});
  @override
  State<StatefulWidget> createState() {
    return LearnLanguageState();
  }
}

class LearnLanguageState extends State<LearnLanguages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedLanguage),
      ),
      body: Center(
        child: Text("Course Content Here"),
      ),
    );
  }
}
