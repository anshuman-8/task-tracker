import 'package:flutter/material.dart';
import 'package:task_tracker/screens/settings-items.dart';
import '/utils/colors.dart';

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  static String routeName = "/settings";
//...final

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              backgroundColor: backgroundColor,
              title: const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SettingsItems(),
            )
          ],
        ),
      ),
    );
  }
}
