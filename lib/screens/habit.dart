import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:task_tracker/utils/colors.dart';
import 'package:task_tracker/widgets/habit_popup.dart';
import '../modals/habit.dart';

class HabitPage extends StatefulWidget {
  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
  int _streak = 5;

  int _habits = 4;

  Widget habitBar(BuildContext context, String habit, int streak) {
    return GestureDetector(
      // onForcePressEnd: () {},
      onTap: () {
        print(0);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListTile(
          leading: CircleAvatar(
            maxRadius: 14,
          ),
          title: Text(habit),
        ),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
            gradient:
                LinearGradient(colors: [Colors.indigo, Colors.blueAccent])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var habitList = Provider.of<HabitProvider>(context).getHabit;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 23,
          ),
          HabitStreak(_streak),
          SizedBox(
            height: 23,
          ),
          for (var element in habitList)
            habitBar(context, element.title, element.streak),
          // habitBar(context,element.title,element.streak);
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              // onTap: () =>,
              onPressed: _habits <= 5
                  ? () {
                      Navigator.of(context).push(HeroDialogRoute(
                        builder: (context) {
                          return AddHabitPopupCard();
                        },
                      ));
                    }
                  : null,
              icon: Icon(Icons.playlist_add_outlined),
              label: Text("New Habit"))
        ],
      ),
    );
  }
}

class HabitStreak extends StatelessWidget {
  // const HabitStreak({Key? key}) : super(key: key);
  HabitStreak(this.count);
  int count = 0;

  Widget fullCircle(int n, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (1 / 8),
      child: n == 0
          ? CircleAvatar(
              maxRadius: 19,
              backgroundColor: Colors.black,
            )
          : CircleAvatar(
              maxRadius: 19,
              backgroundColor: Colors.blue,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final str = <Widget>[];
    for (var i = 0; i < count; i++) {
      str.add(fullCircle(1, context));
    }
    for (var i = count; i < 7; i++) {
      str.add(fullCircle(0, context));
    }
    return Container(
      child: Row(
        children: str,
      ),
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.91,
      height: 50,
    );
  }
}
