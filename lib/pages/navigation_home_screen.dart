import 'package:flutter/material.dart';
import '/settings/my_app_settings.dart';
import 'home/home_screen.dart';
import '../widgets/custom_drawer/drawer_user_controller.dart';
import '../my_app_theme.dart';
import '/widgets/custom_drawer/home_drawer.dart';
import 'navigation/feedback_screen.dart';
import 'navigation/help_screen.dart';
import 'navigation/invite_friend_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const Home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: MyAppTheme.nearlyWhite,
        body: DrawerUserController(
          screenIndex: drawerIndex,
          drawerWidth: MediaQuery.of(context).size.width * 0.75,
          onDrawerCall: (DrawerIndex drawerIndexdata) {
            changeIndex(drawerIndexdata);
            //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
          },
          screenView: screenView,
          //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const Home();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.Settings) {
        setState(() {
          screenView = const MyAppSettings();
        });
      } else if (drawerIndex == DrawerIndex.Contact) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Share) {
        setState(() {
          screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}
