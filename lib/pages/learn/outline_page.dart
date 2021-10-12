import 'package:flutter/material.dart';
import '/my_app_theme.dart';
import 'package:provider/provider.dart';
import '/models/outline.dart';
import '/providers/outlines.dart';

class CourseOutlinePage extends StatefulWidget {
  const CourseOutlinePage({Key? key}) : super(key: key);

  @override
  _CourseOutlinePageState createState() => _CourseOutlinePageState();
}

class _CourseOutlinePageState extends State<CourseOutlinePage>
    with TickerProviderStateMixin {
  //List<CourseOutline> courseOutline = OutlinesList().getCourseOutline;
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final pro = ModalRoute.of(context)!.settings.arguments as String;
    final courseOutlines = Provider.of<OutlinesList>(context);
    final courseOutline = courseOutlines.getCourseOutlines;
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<bool>(
                    future: getData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      } else {
                        return ListView(
                          padding: const EdgeInsets.only(
                              top: 0, left: 12, right: 12),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: List<Widget>.generate(
                            courseOutline.length,
                            (int index) {
                              final int count = courseOutline.length;
                              final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: animationController!,
                                  curve: Interval((1 / count) * index, 1.0,
                                      curve: Curves.fastOutSlowIn),
                                ),
                              );
                              animationController?.forward();
                              return OutlineListView(
                                animation: animation,
                                animationController: animationController,
                                listData: courseOutline[index],
                                callBack: () {
                                  if (courseOutline[index].isActive) {
                                    Navigator.push<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            courseOutline[index]
                                                .navigateScreen!,
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class OutlineListView extends StatelessWidget {
  const OutlineListView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final CourseOutline? listData;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (listData!.isActive)
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 32,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24.0),
                      ),
                      color: MyAppTheme.skyBlue,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          listData!.number,
                          style: MyAppTheme.darkTextTheme.headline1?.copyWith(
                            color: MyAppTheme.white.withOpacity(.5),
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(width: 20),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${listData!.duration} mins\n",
                                style: MyAppTheme.darkTextTheme.subtitle1,
                              ),
                              TextSpan(
                                text: listData!.title,
                                style: MyAppTheme.darkTextTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: callBack,
                          child: const CircleAvatar(
                            radius: 24.0,
                            backgroundColor: MyAppTheme.grey,
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: MyAppTheme.green,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                if (!listData!.isActive)
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      color: MyAppTheme.grey,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          listData!.number,
                          style: MyAppTheme.darkTextTheme.headline1?.copyWith(
                            color: MyAppTheme.white.withOpacity(.15),
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(width: 20),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${listData!.duration} mins\n",
                                style: MyAppTheme.darkTextTheme.bodyText1,
                              ),
                              TextSpan(
                                text: listData!.title,
                                style: MyAppTheme.darkTextTheme.subtitle1?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: callBack,
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyAppTheme.green
                                  .withOpacity(listData!.isDone ? 1 : 0.3),
                            ),
                            child: const Icon(Icons.play_arrow,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
