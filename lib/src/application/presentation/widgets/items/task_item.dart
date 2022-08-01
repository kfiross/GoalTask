import 'package:flutter/material.dart';
import 'package:goal_task/src/application/data/model/task_model.dart';

class TaskItem extends StatelessWidget{
  final TaskModel task;
  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(task.name);
  }

}