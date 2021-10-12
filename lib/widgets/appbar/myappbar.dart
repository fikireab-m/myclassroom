import 'package:flutter/material.dart';
import '../../my_app_theme.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(this.titleText, {Key? key}) : super(key: key);
  final String? titleText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  titleText!,
                  style: MyAppTheme.darkTextTheme.headline2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              child: Row(
                children: [
                  Icon(Icons.date_range,color: Colors.white,),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "<${DateTime.now()}>",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
