import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb('todo.db');
    return _database!;
  }

  Future<Database> _initDb(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(db, version) async {
    // final idType=''
    print("1 : making database");
    return await db.rawInsert(
        'CREATE TABLE todo_database(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT NOT NULL,description TEXT, isDone BOOLEAN NOT NULL,endDate TEXT, dateTime TEXT NOT NULL,label TEXT) ');
  }

  static Future<int> addToDb(String title, String description, DateTime endDate,
      DateTime datetime, String? lable) async {
    final db = await instance.database;
    lable ??= '';
    try {
      int id1 = await db.rawInsert(
          'INSERT INTO todo_database(title,description,isDone, endDate,dateTime,label ) VALUES(${title.toString()}, ${description.toString()},0,${endDate.toIso8601String()},${datetime.toIso8601String()},${lable.toString()} )');
      print('inserted1: $id1');
      return id1;
    } catch (e) {
      print("2 error: ${e.toString()}");
    }
    return -1;
  }

  static Future<List<Map<String, dynamic>>> getTodo() async {
    final db = await instance.database;
    List<Map<String, dynamic>> list =
        await db.rawQuery('SELECT * FROM todo_database');
    print(list);
    return list;
  }

  static Future<void> updateTodo(int id, int boolInt) async {
    final db = await instance.database;
    await db.rawUpdate(
        'UPDATE todo_database SET isDone = ? WHERE id = ?', [boolInt, id]);
  }

  static Future<void> deleteTodo(int id) async {
    final db = await instance.database;
    await db.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
