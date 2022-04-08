import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:task_tracker/widgets/bottom_nav.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: const Text(
              "Home",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: HomeScreenItems(),
          )
        ],
      ),
      floatingActionButton: MainSpeedDial(),
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
