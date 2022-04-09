import 'package:flutter/material.dart';
import 'package:task_tracker/modals/user.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  //  UserDetails({Key? key}) : super(key: key);
  static String routeName = "/user-details";

  var fNameCtrl = TextEditingController();
  var lNameCtrl = TextEditingController();
  var ageCtrl = TextEditingController();
  var emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData>(context);
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Text("Details"),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                // child: Text("First Name"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: TextFormField(
                  controller: fNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'First Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: TextFormField(
                  controller: lNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Last Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: TextFormField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Age',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: TextFormField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Container(
                  width: 45, //MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                      onPressed: () {
                        userData.setUser(fNameCtrl.text, lNameCtrl.text,
                            emailCtrl.text, ageCtrl.text);
                      },
                      child: Text("Save")))
            ],
          ),
        ));
  }
}
