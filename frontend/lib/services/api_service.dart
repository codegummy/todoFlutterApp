import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:todo/models/task.dart';

class ApiService {
  static const String baseUrl = "http://192.168.0.84:3000";

  Future<Task?> deleteTask(String id) async {
    try {
      final response = await http.delete(Uri.parse("$baseUrl/tasks/$id"));
      if(response.statusCode != 200){
        throw Exception("Failed to delte task");
      }
    } catch (e) {
      print("Error deleting task: $e");
      throw Exception("Error deleting task: $e");
    }
  }


  Future<Task?> createTask(String text) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/tasks"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "text": text,
            "dateCreated": DateTime.now().toIso8601String(),
            "isCompleted": false
          }));

      if (response.statusCode == 200) {
        return Task.fromJson(jsonDecode(response.body));
      } else {
        print("Failed to create task. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception("Failed to create task");
      }
    } catch (e) {
      // I need to find the errors!!!!!!!!!!
      print("Error creating task: $e");
      throw Exception("Error creating task: $e");
    }
  }

  Future<List<Task>?> fetchTasks() async {
    try {
      //get the page from my backend
      final response = await http.get(Uri.parse("$baseUrl/alltasks"));

      if (response.statusCode == 200) {
        //get the body which is gonna be what the Taks.find returns ie all the saved tasks and convert from json to a list of jsons
        List<dynamic> body = jsonDecode(response.body);

        //create a list called tasks from the body. each item in the body is a json, so the Task.fromJosn changes the JSON to a Task object
        List<Task> tasks =
            body.map((dynamic item) => Task.fromJson(item)).toList();
        return tasks;
      } else {
        //checking errors again
        print("Failed to fetch tasks. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception("Failed to fetch tasks");
      }
    } catch (e) {
      print("Error creating task: $e");
      throw Exception("Error creating task: $e");
    }
  }
}
