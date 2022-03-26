import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);
  static String routeName = "/user-details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              // Container(
              //   child: Text("Your Details: "),
              // ),
              Container(
                child: Text("First Name"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
