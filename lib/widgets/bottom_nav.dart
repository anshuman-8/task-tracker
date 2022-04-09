import 'package:flutter/material.dart';
import 'package:task_tracker/screens/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _index = 2;
  final _item = <Widget>[
    Icon(EvaIcons.grid),
    Icon(EvaIcons.twitter),
    Icon(
      Icons.home_filled,
      // color: Colors.teal,
    ),
    Icon(EvaIcons.checkmarkCircle),
    Icon(EvaIcons.settings)
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.white,
      buttonBackgroundColor: Colors.tealAccent[700],
      backgroundColor: Colors.transparent,
      items: _item,
      index: _index,
      height: 55,
      onTap: (index) {
        this._index = index;
      },
    );
  }
}
