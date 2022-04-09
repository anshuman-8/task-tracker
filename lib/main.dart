import 'package:flutter/material.dart';
import 'package:task_tracker/modals/todo.dart';
import 'package:task_tracker/modals/user.dart';
import 'package:task_tracker/screens/home_screen.dart';
import 'package:task_tracker/screens/settings.dart';
import 'package:task_tracker/screens/user_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/utils/colors.dart';
// import './database/todo_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NotesDatabase.NotesDataBase;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Tracker',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        // home: BottomAppBar(),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          Settings.routeName: (context) => Settings(),
          UserDetails.routeName: (context) => UserDetails(),
        },
      ),
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