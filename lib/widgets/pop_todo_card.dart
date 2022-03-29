import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/modals/todo.dart';

class AddTodoPopupCard extends StatefulWidget {
  AddTodoPopupCard({Key? key}) : super(key: key);
  static const String _heroAddTodo = 'add-todo-hero';

  @override
  State<AddTodoPopupCard> createState() => _AddTodoPopupCardState();
}

class _AddTodoPopupCardState extends State<AddTodoPopupCard> {
  final titleCtrl = TextEditingController();

  final descriptionCtrl = TextEditingController();
  String? _lable = null;
  DateTime _selectedDate = DateTime.now();

  void changeDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        _selectedDate = datePicked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoitemAdd = Provider.of<TodoProvider>(context).addTodo;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: AddTodoPopupCard._heroAddTodo,
          child: Material(
            color: Colors.teal[300],
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: titleCtrl,
                            decoration: InputDecoration(
                              hintText: 'New todo',
                              border: InputBorder.none,
                            ),
                            cursorColor: Colors.white,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 0.3,
                          ),
                          TextFormField(
                            controller: descriptionCtrl,
                            decoration: InputDecoration(
                              hintText: 'Write a note',
                              border: InputBorder.none,
                            ),
                            cursorColor: Colors.white,
                            maxLines: 4,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 0.3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.teal[400]),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black)),
                                  onPressed: () {
                                    changeDate();
                                  },
                                  icon: Icon(Icons.calendar_today_rounded),
                                  label: Text(
                                    (_selectedDate == DateTime.now())
                                        ? "Today"
                                        : DateFormat.MMMd('en_US')
                                            .format(_selectedDate),
                                  ),
                                ),
                              ),
                              DropdownButton<String>(
                                value: _lable,
                                elevation: 8,
                                style: TextStyle(color: Colors.black),
                                items: <String>[
                                  'Priority 1',
                                  'Priority 2',
                                  'Priority 3',
                                  'Goals',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                hint: const Text(
                                  "Lables",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w200),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _lable = value;
                                  });
                                },
                              ),
                              // SizedBox(
                              //   width: 23,
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.teal[500]),
                            ),
                            onPressed: () {
                              if (titleCtrl.text.trim() == "") {
                                print("null${titleCtrl.text}");
                                return;
                              } else {
                                print("yes${titleCtrl.text}");
                                todoitemAdd(
                                    titleCtrl.text,
                                    descriptionCtrl.text,
                                    _selectedDate,
                                    _lable);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Add',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    required WidgetBuilder builder,
    // required RouteSettings settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}
