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
        backgroundColor: Color.fromARGB(255, 139, 204, 199),
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
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: 34,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            userData.setUser(fNameCtrl.text, lNameCtrl.text,
                                emailCtrl.text, ageCtrl.text);
                          },
                          icon: Icon(Icons.save_rounded),
                          label: Text("Save")),
                    ],
                  ))
            ],
          ),
        ));
  }
}
