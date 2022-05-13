import 'package:flutter/material.dart';

class SettingsItems extends StatelessWidget {
  const SettingsItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            child: Text("Settings"),
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
