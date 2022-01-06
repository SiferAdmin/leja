class TaskStatistic {
  TaskStatistic({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum>? data;

  factory TaskStatistic.fromMap(Map<String, dynamic> json) => TaskStatistic(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        // ignore: unnecessary_null_comparison
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.todo,
    required this.inProgress,
    required this.completed,
  });

  int todo;
  int inProgress;
  int completed;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        todo: json["todo"],
        inProgress: json["in_progress"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "todo": todo,
        "in_progress": inProgress,
        "completed": completed,
      };
}
