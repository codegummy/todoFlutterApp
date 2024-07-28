
class Task {
  // each task will have a text, completed, time made and time completed
  String text;
  DateTime dateCreated;
  String id;

  bool isCompleted;

  Task({
    required this.id,
    required this.text,
    required this.dateCreated,
    required this.isCompleted,
  });

  //create task object from a json
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["_id"],
      text: json["text"],
      isCompleted: json["isCompleted"],
      dateCreated: DateTime.parse(json["dateCreated"]),
    );
  }

  //convert task object to a json
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "text": text,
      "isCompleted": isCompleted,
      "dateCreated": dateCreated.toIso8601String(),
    };
  }
}
