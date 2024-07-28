// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/services/api_service.dart';

class AddTodoDialogBox extends StatefulWidget {
  TextEditingController taskController;

  AddTodoDialogBox({super.key, required this.taskController});

  @override
  State<AddTodoDialogBox> createState() => _AddTodoDialogBoxState();
}

class _AddTodoDialogBoxState extends State<AddTodoDialogBox> {
  final ApiService _apiService = ApiService();

  void saveTask() async {
    String text = widget.taskController.text;
   
    if (text.isNotEmpty) {
      try {
        await _apiService.createTask(text);
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Task created successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Function said nope $e")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Task name cannot be empty")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        width: 200,
        height: 200,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(25))),

            //text field
        child: TextField(
          decoration: InputDecoration(hintText: "Enter task"),
          controller: widget.taskController,
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close")),
        TextButton(onPressed: saveTask, child: Text("Save")),
      ],
    );
  }
}
