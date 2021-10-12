import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("This is the learning page"),
          );
        }),
      ),
    );
  }
}
