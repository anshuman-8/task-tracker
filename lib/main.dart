import 'package:flutter/material.dart';
import 'package:task_tracker/screens/home_screen.dart';
import 'package:task_tracker/screens/settings.dart';
import 'package:task_tracker/screens/user_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Settings.routeName: (context) => Settings(),
        UserDetails.routeName: (context) => UserDetails(),
      },
    );
  }
}
