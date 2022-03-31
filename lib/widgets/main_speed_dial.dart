import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:task_tracker/utils/colors.dart';
import 'package:task_tracker/widgets/pop_todo_card.dart';

class MainSpeedDial extends StatefulWidget {
  const MainSpeedDial({Key? key}) : super(key: key);

  @override
  State<MainSpeedDial> createState() => _MainSpeedDialState();
}
const String _heroAddTodo = 'add-todo-hero';
class _MainSpeedDialState extends State<MainSpeedDial> {
  @override
  Widget build(BuildContext context) {
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
}
