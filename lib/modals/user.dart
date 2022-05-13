import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String id;
  String fName;
  String? lName;
  String? email;
  String? age;

  User(this.id, this.fName, this.lName, this.age, this.email);
}

class UserData with ChangeNotifier {
  static User? _user;

  setUser(fName, lName, email, age) async {
    // final prefs = await SharedPreferences.getInstance();
    _user = User(email, fName, lName, email, age);
    // await prefs.setInt('counter', 10);
    notifyListeners();
  }

  User? getUser() {
    notifyListeners();
    return _user;
  }
}
