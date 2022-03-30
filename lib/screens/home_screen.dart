import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:task_tracker/screens/home_items.dart';
import 'package:task_tracker/utils/colors.dart';
import 'package:task_tracker/widgets/home_drawer.dart';
import 'package:task_tracker/widgets/pop_todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const String _heroAddTodo = 'add-todo-hero';

class _HomeScreenState extends State<HomeScreen> {
  Widget speedDial() {
    return SpeedDial(
      animationSpeed: 360,
      label: Text("Add"),
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Colors.green,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: const Hero(
              tag: _heroAddTodo,
              child: Icon(
                Icons.task_alt_sharp,
              ),
            ),
            backgroundColor: Colors.green,
            onTap: () => Navigator.of(context).push(HeroDialogRoute(
                  builder: (context) {
                    return AddTodoPopupCard();
                  },
                )),
            label: 'Todo',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.green),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.alarm_add_sharp),
            backgroundColor: Colors.green,
            onTap: () {},
            label: 'Reminder',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.green)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            backgroundColor: backgroundColor,
            title: Text(
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
      floatingActionButton: speedDial(),
    );
  }
}
