import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/todo.dart';

class TodoCard extends StatefulWidget {
  final int index;
  const TodoCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  var done = false;
  Color? color = Colors.grey[600];
  void boxColor(String? lable) {
    if (lable == "Priority 1") {
      color = Colors.red[400];
    }
    if (lable == "Priority 2") {
      color = Colors.amberAccent[400];
    }
    if (lable == "Priority 3") {
      color = Colors.blue[400];
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoitem = Provider.of<TodoProvider>(context);
    var item = todoitem.todoItems[widget.index];
    boxColor(item.lable);
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(todoitem.todoItems[widget.index].id),
      onDismissed: (dir) {
        Provider.of<TodoProvider>(context, listen: false)
            .removeItem(todoitem.todoItems[widget.index].id);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Removed"),
          duration: Duration(seconds: 2),
        ));
      },
      confirmDismiss: (dir) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text("Delete the task!!!"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("Yes")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("No")),
                ],
              );
            });
      },
      background: Container(
        padding: const EdgeInsets.fromLTRB(2, 2, 16, 2),
        color: Color.fromARGB(255, 190, 16, 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white70,
          size: 25,
        ),
        alignment: Alignment.centerRight,
      ),
      child: Container(
        child: ListTile(
          leading: IconButton(
            icon: done
                ? Icon(
                    Icons.check_box_outlined,
                    color: color,
                  )
                : Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: color,
                  ),
            onPressed: () {
              setState(() {
                done = !done;
              });
              todoitem.todoDone(item.id);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //remove const for action
                content: Text("Congratulations!!! Task Completed."),
                // action: SnackBarAction(
                //   label: "UNDO",
                //   onPressed: () {
                //     todoitem.todoDone(todoitem.todoItems[widget.index].id);
                //   },
                // ),
                duration: Duration(seconds: 2),
              ));
            },
          ),
          title: Text(item.title.toString()),
          subtitle: Text(item.description.toString()),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(DateFormat.MMMd('en_US').format(item.endDate)),
              !((item.lable.toString()) == "null")
                  ? Text(
                      item.lable.toString().toUpperCase(),
                      style: TextStyle(color: color),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
