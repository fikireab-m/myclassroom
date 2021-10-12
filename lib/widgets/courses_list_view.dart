import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myclassroom/my_app_theme.dart';
import '../models/course.dart';

class CourseListView extends StatelessWidget {
  const CourseListView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final Course? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: Container(
                decoration: BoxDecoration(
                    color: MyAppTheme.blackColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    )),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/inviteImage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 40.0,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color: MyAppTheme.blackColor.withOpacity(1.0),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listData!.title,
                          textAlign: TextAlign.center,
                          style: MyAppTheme.darkTextTheme.headline3,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: MyAppTheme.green,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4.0),
                            bottomRight: Radius.circular(4.0),
                            topLeft: Radius.circular(16.0),
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.grey.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                          onTap: callBack,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 8.0),
                              Text(
                                "Add Course",
                                style: MyAppTheme.darkTextTheme.headline3,
                              ),
                              SizedBox(width: 8.0),
                              Icon(FontAwesomeIcons.plusCircle),
                              SizedBox(width: 8.0),
                            ],
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
      },
    );
  }
}
