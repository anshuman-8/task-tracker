import 'package:flutter/material.dart';

class Todo {
  String id;
  String title;
  String description;
  bool isDone;
  DateTime endDate;
  DateTime dateTime;
  String? lable;

  Todo(this.id, this.title, this.description, this.isDone, this.endDate,
      this.dateTime, this.lable);
}

class TodoProvider with ChangeNotifier {
  List<Todo> _todoItems = [];

  List<Todo> get todoItems {
    // return [..._todoItems.where((element) => element.isDone==false)];
    List<Todo> list = [];
    list = list +
        [..._todoItems.where((element) => element.lable == 'Priority 1')];
    list = list +
        [..._todoItems.where((element) => element.lable == 'Priority 2')];
    list = list +
        [..._todoItems.where((element) => element.lable == 'Priority 3')];

    list = list + [..._todoItems.where((element) => element.lable == null)];
    list = list + [..._todoItems.where((element) => element.lable == 'Goals')];
    return list;
  }

  void addTodo(
      String title, String description, DateTime endDate, String? lable) {
    _todoItems.add(Todo(DateTime.now().toIso8601String(), title, description,
        false, endDate, DateTime.now(), lable));
    notifyListeners();
  }

  void todoDone(String id) {
    var index = _todoItems.indexWhere((element) => element.id == id);
    _todoItems[index].isDone = !_todoItems[index].isDone;
    notifyListeners();
  }

  void removeItem(String id) {
    int index = _todoItems.indexWhere((element) => element.id == id);
    _todoItems.removeAt(index);
    notifyListeners();
  }
}
