import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:task_tracker/screens/settings-items.dart';
import 'package:task_tracker/screens/settings.dart';
// import 'package:task_tracker/widgets/bottom_nav.dart';
import './twitter_screen.dart';
import './video-screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import './home_items.dart';
import '/utils/colors.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// const String _heroAddTodo = 'add-todo-hero';

class _HomeScreenState extends State<HomeScreen> {
  void getPages(int index) {
    setState(() {
      _index = index;
    });
  }

  final _item = <Widget>[
    Icon(EvaIcons.videoOutline),
    Icon(EvaIcons.twitter),
    Icon(
      Icons.home_filled,
      // color: Colors.teal,
    ),
    Icon(EvaIcons.checkmarkCircle),
    Icon(EvaIcons.settings)
  ];
  final pageNames = <String>["Videos", "Twitter", "Home", "Todo", "Settings"];
  final screens = <Widget>[
    VideoScreen(),
    TwitterScreen(),
    HomeScreenItems(),
    HomeScreenItems(),
    SettingsItems()
  ];
  int _index = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: HomeDrawer(),
        extendBody: true,
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              backgroundColor: backgroundColor,
              title: Text(
                pageNames[_index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: screens[_index],
            )
          ],
        ),
        floatingActionButton: MainSpeedDial(),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          buttonBackgroundColor: Colors.tealAccent[700],
          backgroundColor: Colors.transparent,
          items: _item,
          index: _index,
          height: 50,
          onTap: (index) {
            setState(() {
              _index = index;
            });

            // Navigator.of(context).pushNamed(screens[index]);
          },
        ),
      ),
    );
  }
}
