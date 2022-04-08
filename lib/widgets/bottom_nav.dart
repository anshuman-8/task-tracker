import 'package:flutter/material.dart';
import 'package:task_tracker/screens/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _index = 0;
  final _item = <Widget>[
    Icon(
      Icons.home_filled,
      // color: Colors.teal,
    ),
    Icon(Icons.task_alt_rounded),
    Icon(Icons.settings)
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.white,
      buttonBackgroundColor: Colors.tealAccent[700],
      backgroundColor: Colors.transparent,
      items: _item,
      height: 55,
      onTap: (index) {
        this._index = index;
      },
    );
  }
}
