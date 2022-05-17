import 'package:flutter/material.dart';
import 'package:task_tracker/modals/todo.dart';
import 'package:task_tracker/screens/home_screen.dart';
import 'package:task_tracker/screens/qr-generate.dart';
import 'package:task_tracker/screens/qr-scanner.dart';
import 'package:task_tracker/screens/settings.dart';
import 'package:task_tracker/screens/user_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/screens/video-screen.dart';
import 'package:task_tracker/utils/colors.dart';
import 'package:flutter/services.dart';
import './modals/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  // runApp(MyApp());
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
          VideoScreen.routeName: (context) => VideoScreen(),
          Settings.routeName: (context) => Settings(),
          QRScanner.routeName: (context) => QRScanner(),
          GenerateQR.routeName: (context) => GenerateQR(),
        },
      ),
    );
  }
}


// AIzaSyBUrZ_7mDrM7tz1KTRskMgzcPR_i0pX5rc
// AIzaSyBUrZ_7mDrM7tz1KTRskMgzcPR_i0pX5rc


