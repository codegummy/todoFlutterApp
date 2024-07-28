class Task {
  // each task will have a text, completed, time made and time completed
  String text;
  DateTime dateCreated;

  bool isCompleted;

  Task({
    required this.text,
    required this.dateCreated,
    required this.isCompleted,
  });

  //convert task object to a json
  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "isCompleted": isCompleted,
      "dateCreated": dateCreated.toIso8601String(),
     
    };
  }

  //create task object from a json
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      text: json["text"],
      isCompleted: json["isCompleted"],
      dateCreated: DateTime.parse(json["dateCreated"]),
      
    );
  }
}
