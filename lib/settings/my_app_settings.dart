import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppSettings extends StatefulWidget {
  const MyAppSettings({Key? key}) : super(key: key);

  @override
  _MyAppSettingsState createState() => _MyAppSettingsState();
}

class _MyAppSettingsState extends State<MyAppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height*0.33,
          )
        ],
      ),
    );
  }
}