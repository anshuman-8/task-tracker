import 'package:flutter/material.dart';

class HabitPage extends StatelessWidget {
  const HabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 23,
          ),
          HabitStreak(),
        ],
      ),
    );
  }
}

class HabitStreak extends StatelessWidget {
  const HabitStreak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          
        ],
      ),
      color: Colors.amber,
      width: MediaQuery.of(context).size.width * 0.91,
      height: 55,
    );
  }
}
