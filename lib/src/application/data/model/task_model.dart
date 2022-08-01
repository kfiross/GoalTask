class TaskModel {
  final String name;

  TaskModel({required this.name});

  Map<String, dynamic> toJSON() => {
        'name': name,
      };

  static TaskModel fromJSON(Map map) {
    return TaskModel(name: map['name']);
  }
}
