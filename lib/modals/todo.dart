import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../database/todo_database.dart';

class Todo {
  String id;
  String title;
  String description;
  bool isDone;
  DateTime endDate;
  DateTime dateTime;
  String? label;

  Todo(this.id, this.title, this.description, this.isDone, this.endDate,
      this.dateTime, this.label);
}

class TodoProvider with ChangeNotifier {
  List<Todo> _todoItems = [];

  static Database? _database;

  List<Todo> get todoItems {
    // return [..._todoItems.where((element) => element.isDone==false)];
    List<Todo> list = [];
    list = list +
        [..._todoItems.where((element) => element.label == 'Priority 1')];
    list = list +
        [..._todoItems.where((element) => element.label == 'Priority 2')];
    list = list +
        [..._todoItems.where((element) => element.label == 'Priority 3')];

    list = list +
        [
          ..._todoItems
              .where((element) => element.label == null || element.label == "")
        ];
    list = list + [..._todoItems.where((element) => element.label == 'Goals')];
    return list;
  }

  Future<void> getAndSetTodo() async {
    final todoList = await NotesDatabase.getTodo();
    for (var itm in todoList) {
      bool isD = false;
      if (itm['isDone'] == 1) {
        isD = true;
      }
      _todoItems.add(Todo(
          itm['id'].toString(),
          itm['title'],
          itm['description'],
          isD,
          DateTime.parse(itm['endDate']),
          DateTime.parse(itm['dateTime']),
          itm['label']));
    }
    notifyListeners();
  }

  Future<void> addTodo(
      String title, String description, DateTime endDate, String? lable) async {
    final datetime = DateTime.now();
    final id = await NotesDatabase.addToDb(
        title, description, endDate, datetime, lable);
    _todoItems.add(Todo(
        id.toString(), title, description, false, endDate, datetime, lable));

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
