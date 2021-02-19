import 'package:flutter/material.dart';

class LearnOthers extends StatefulWidget {
  final String selectedTopic;
  LearnOthers({this.selectedTopic});
  @override
  State<StatefulWidget> createState() {
    return LearnOtherState();
  }
}

class LearnOtherState extends State<LearnOthers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedTopic),
      ),
      body: Center(
        child: Text("Content Here"),
      ),
    );
  }
}
