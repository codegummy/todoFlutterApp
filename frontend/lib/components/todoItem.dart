// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  String text;
  String dateCreated;
  bool isCompleted;
 final VoidCallback onDelete;
  TodoItem(
      {super.key,
      required this.text,
      required this.dateCreated,
      required this.onDelete,
      required this.isCompleted});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.text),
      subtitle: Text(widget.dateCreated),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete)),
          Checkbox(
            value: widget.isCompleted,
            onChanged: (bool? value) {
              setState(() {
                widget.isCompleted = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
/** Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(text),
    ); */