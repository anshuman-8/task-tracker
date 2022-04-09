import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  setUser(fName, lName, email, age) {
    _user = User(email, fName, lName, email, age);
    notifyListeners();
  }

  User? getUser() {
    notifyListeners();
    
    return _user;
  }
}
