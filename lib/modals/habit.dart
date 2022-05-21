import 'package:flutter/widgets.dart';

class Habit {
  String title;
  DateTime dateTime;
  int streak;
  Habit(this.title, this.dateTime, this.streak);
}

class HabitProvider with ChangeNotifier {
  // String work = "";
  List<Habit> _habit = [];

  List<Habit> get getHabit {
    return [..._habit];
  }

  void newHabit(String title) {
    // int a = 0;
    _habit.add(Habit(title, DateTime.now(), 0));
    notifyListeners();
  }
}
