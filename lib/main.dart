import 'package:flutter/material.dart';
import 'package:task_tracker/modals/todo.dart';
import 'package:task_tracker/screens/home_screen.dart';
import 'package:task_tracker/screens/settings.dart';
import 'package:task_tracker/screens/user_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        )
      ],
      child:
MaterialApp(
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
    ) ,
    );
  }
}







// MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Task Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//       routes: {
//         HomeScreen.routeName: (context) => HomeScreen(),
//         Settings.routeName: (context) => Settings(),
//         UserDetails.routeName: (context) => UserDetails(),
//       },
//     );