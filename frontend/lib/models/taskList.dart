import 'package:todo/models/task.dart';

class Tasklist {
  List<Task> _tasks;

  Tasklist({required List<Task> tasks}) : _tasks = tasks;

  //getter for list
  List<Task> get tasks => _tasks;

  //setter for list
  set tasks(List<Task> newTasks) {
    _tasks = newTasks; 
  }
}
