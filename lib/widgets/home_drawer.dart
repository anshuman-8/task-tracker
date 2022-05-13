import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_tracker/screens/home_screen.dart';
import 'package:task_tracker/screens/qr-scanner.dart';
import 'package:task_tracker/screens/settings.dart';
import 'package:task_tracker/screens/user_details_screen.dart';
import 'package:task_tracker/utils/colors.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  Widget MenuItems(String text, IconData icon, Function onpressed) {
    return Container(
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: () => onpressed(),
      ),
      margin: EdgeInsets.symmetric(vertical: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.67,
        child: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 85,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: lightBackgroundColor,
                    ),
                    child: Text("Anshuman"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MenuItems("Home", Icons.home, () {
                    Navigator.of(context).pop();
                    // Navigator.of(context)
                    //     .popUntil((route) => route == HomeScreen.routeName);
                  }),
                  MenuItems("Quick Notes", Icons.notes, () {}),
                  MenuItems("User Details", Icons.account_box_outlined, () {
                    Navigator.of(context).pushNamed(UserDetails.routeName);
                  }),
                  MenuItems("Scan QR", Icons.qr_code_scanner, () {
                    Navigator.of(context).pushNamed(QRScanner.routeName);
                  }),
                  Divider(
                    thickness: 2,
                    color: Colors.blueGrey[200],
                    endIndent: 9,
                    indent: 9,
                  ),
                  MenuItems("Settings", Icons.settings, () {
                    Navigator.of(context).pushNamed(Settings.routeName);
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
