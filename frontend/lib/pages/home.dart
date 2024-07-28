// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:todo/components/addTodoDialogBox.dart';
import 'package:todo/components/taskList.dart';
import 'package:todo/components/todoItem.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/api_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // controller
  var taskController = TextEditingController();

 
  void showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddTodoDialogBox(
            taskController: taskController,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Tasklist()),
            ElevatedButton(
                onPressed: () {
                  showDialogBox(context);
                },
                child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}

/** child: ElevatedButton(
            onPressed: () async {
              try {
                final response = await http.get(Uri.parse("http://192.168.0.84:3000"));

                if (response.statusCode == 200) {
                  print("Response : ${response.body} ");
                } else {
                  print("Failed to load data. Status code: ${response.statusCode}");
                }
              } catch (e) {
                print("An error occurred: $e");
              }
            },
            child: Text("Press me"),
          ), */