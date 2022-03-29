import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/modals/todo.dart';
import 'package:task_tracker/widgets/todo_card.dart';

class HomeScreenItems extends StatefulWidget {
  @override
  State<HomeScreenItems> createState() => _HomeScreenItemsState();
}

class _HomeScreenItemsState extends State<HomeScreenItems> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  final quickNoteCtrl = TextEditingController();

  XFile? _image;

  Future<void> getImageCam() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future<void> getImageGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoitem = Provider.of<TodoProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
            alignment: Alignment.topLeft,
            child: Text(
              " ${greeting()} Anshuman",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 21),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 33, vertical: 5),
            child: Text(
              "Status: Great",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          // width: 200,
                          child: Text(
                            "Quick Note:",
                            style: TextStyle(
                                color: Colors.teal[800], fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        TextField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "e.g. Call Sam at 4 ",
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.send_rounded,
                                  size: 30,
                                  color: Colors.teal[800],
                                )),
                            // focusedBorder: ,
                            // helperText: "What is going in your mind?"
                          ),
                          controller: quickNoteCtrl,
                          maxLines: 1,
                          cursorColor: Colors.green[800],
                          cursorHeight: 30,
                        ),
                        Row(
                          children: [
                            IconButton(
                                color: Colors.teal[800],
                                onPressed: () => getImageGallery(),
                                icon: Icon(Icons.add_photo_alternate_outlined)),
                            IconButton(
                                color: Colors.teal[800],
                                onPressed: () => getImageCam(),
                                icon: Icon(Icons.add_a_photo_outlined))
                          ],
                        ),
                        _image != null
                            ? Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 180,
                                  width: 220,
                                  child: Image.file(File(_image!.path)),
                                ),
                                Positioned(
                                    top: -13,
                                    right: -5,
                                    child: TextButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromRGBO(
                                                      217, 250, 246, 0.5)),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _image = null;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.highlight_remove_rounded,
                                          color: Colors.deepOrange,
                                          size: 18,
                                        ),
                                        label: const Text(
                                          "Remove",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.deepOrange),
                                        ))),
                              ])
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 25),
            child: Text(
              "Todays work: ",
              style: TextStyle(fontSize: 19),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 7),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
                border: Border.all(color: Colors.blueGrey, width: 2)),
            height: MediaQuery.of(context).size.height * 0.37,
            child: ListView.builder(
                itemCount: todoitem.todoItems.length,
                itemBuilder: (context, index) {
                  return TodoCard(
                    index: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}
