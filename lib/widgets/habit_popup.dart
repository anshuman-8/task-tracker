import 'package:task_tracker/modals/habit.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class AddHabitPopupCard extends StatefulWidget {
  AddHabitPopupCard({Key? key}) : super(key: key);
  static const String _heroAddTodo = 'add-todo-hero';

  @override
  State<AddHabitPopupCard> createState() => _AddHabitPopupCardState();
}

class _AddHabitPopupCardState extends State<AddHabitPopupCard> {
  final titleCtrl = TextEditingController();

  final descriptionCtrl = TextEditingController();
  String? _lable = null;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // final todoitemAdd = Provider.of<HabitProvider>(context);
    return Center(
      // heightFactor: 350,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: AddHabitPopupCard._heroAddTodo,
          child: Material(
              color: Colors.teal[300],
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 20,
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(EvaIcons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 16),
                        child: TextFormField(
                          controller: titleCtrl,
                          decoration: InputDecoration(
                            hintText: 'New Habit',
                            border: InputBorder.none,
                          ),
                          cursorColor: tertiaryColor,
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.3,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(buttonColor),
                        ),
                        onPressed: () {
                          if (titleCtrl.text.trim() == "") {
                            print("null${titleCtrl.text}");
                            return;
                          } else {
                            print("yes${titleCtrl.text}");
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Add',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )),
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
