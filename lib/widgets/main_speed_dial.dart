import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../screens/qr-scanner.dart';
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
      animationSpeed: 250,
      // label: const Text(
      //   "Add",
      //   style: TextStyle(height: 23, color: Colors.white),
      // ),
      icon: Icons.add,
      animatedIconTheme: IconThemeData(size: 19),
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
                fontSize: 14.0),
            labelBackgroundColor: Colors.green),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.alarm_add_sharp),
            backgroundColor: Colors.green,
            onTap: () {},
            label: 'Reminder',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 14.0),
            labelBackgroundColor: Colors.green),

        SpeedDialChild(
            child: const Hero(
              tag: _heroAddTodo,
              child: Icon(
                Icons.qr_code_scanner_outlined,
              ),
            ),
            backgroundColor: Colors.green,
            onTap: () => Navigator.of(context).pushNamed(QRScanner.routeName),
            label: 'QR Scan',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 14.0),
            labelBackgroundColor: Colors.green),
      ],
    );
  }
}
