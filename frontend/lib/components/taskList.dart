import 'package:flutter/material.dart';
import 'package:todo/components/todoItem.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/api_service.dart';

class Tasklist extends StatefulWidget {
  const Tasklist({super.key});

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  //api service
  final ApiService apiService = ApiService();
  late Future<List<Task>?> allTasks;

  @override
  void initState() {
    super.initState();
    allTasks = apiService.fetchTasks();
  }

  void deleteTask(String id) async {
    try {
      await apiService.deleteTask(id);
      setState(() {
        allTasks = apiService.fetchTasks();
      });
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>?>(
        future: allTasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error : ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No tasks found"));
          } else {
            List<Task> tasks = snapshot.data!;
            return ListView.builder(
              reverse: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Task task = tasks[index];

                return TodoItem(
                  onDelete:() => deleteTask(tasks[index].id),
                  text: task.text,
                  dateCreated: task.dateCreated.toString(),
                  isCompleted: task.isCompleted,
                );
              },
            );
          }
        });
  }
}
