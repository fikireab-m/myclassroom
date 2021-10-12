import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../widgets/courses_list_view.dart';
import '../discuss/discuss.dart';
import '../learn/outline_page.dart';
import '../notes/notes.dart';
import '../../providers/courses.dart';
import '../../my_app_theme.dart';
import '../../models/course.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<Course> courseList = Courses().getCourses;
  AnimationController? animationController;
  bool multiple = true;

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

  List<IconData> navBarIcons = [
    FontAwesomeIcons.bookOpen,
    FontAwesomeIcons.solidSadCry,
    FontAwesomeIcons.solidClipboard,
    FontAwesomeIcons.solidComments,
  ];

  List<String> navBarTitles = [
    'Courses',
    'Learn',
    'Notes',
    'Discuss',
  ];
  List<Widget> pages = [
    Home(),
    CourseOutlinePage(),
    NotesPage(),
    DiscussionPage(),
  ];

  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Text(
            navBarTitles.elementAt(currentIndex),
            style: MyAppTheme.darkTextTheme.headline2,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.date_range,color: Colors.white,),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    DateFormat("MMM-d").format(
                      DateTime.now(),
                    ),
                    style: MyAppTheme.darkTextTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: currentIndex == 0 ? buildHome(context) : pages[currentIndex],
      bottomNavigationBar: myBottomBar(context),
    );
  }

  Widget buildHome(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
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
                        return GridView(
                          padding: const EdgeInsets.only(
                              top: 0, left: 12, right: 12),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: List<Widget>.generate(
                            courseList.length,
                            (int index) {
                              final int count = courseList.length;
                              final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: animationController!,
                                  curve: Interval((1 / count) * index, 1.0,
                                      curve: Curves.fastOutSlowIn),
                                ),
                              );
                              animationController?.forward();
                              return CourseListView(
                                animation: animation,
                                animationController: animationController,
                                listData: courseList[index],
                                callBack: () {
                                  // Navigator.push<dynamic>(
                                  //   context,
                                  //   MaterialPageRoute<dynamic>(
                                  //     builder: (BuildContext context) =>
                                  //         courseList[index].navigateScreen!,
                                  //   ),
                                  // );//
                                },
                              );
                            },
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: deviceWidth ~/ 160,
                            mainAxisSpacing: 12.0,
                            crossAxisSpacing: 12.0,
                            childAspectRatio: 1.5,
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

  Widget myBottomBar(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: displayWidth * .05,
      ),
      padding: EdgeInsets.symmetric(horizontal: displayWidth * 0.05),
      height: displayWidth * .02+ 60.0,
      decoration: BoxDecoration(
        color: MyAppTheme.blackColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor,
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          for (int index = 0; index < 4; index++)
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .255
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? displayWidth * .12 : 0,
                      width: index == currentIndex ? displayWidth * .32 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.blueAccent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * .13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? '${navBarTitles[index]}'
                                    : '',
                                style: TextStyle(
                                  fontSize: displayWidth * .03,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * .03
                                  : 20,
                            ),
                            Icon(
                              navBarIcons[index],
                              size: displayWidth * .076,
                              color: index == currentIndex
                                  ? MyAppTheme.dark().bottomNavigationBarTheme.selectedItemColor
                                  : MyAppTheme.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
