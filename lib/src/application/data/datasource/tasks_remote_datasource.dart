import 'package:goal_task/src/application/data/model/task_model.dart';
import 'package:goal_task/src/core/enums.dart';

class TasksRemoteDatasource{
  TasksRemoteDatasource();

  Future<void> addTask(TaskModel taskModel, TaskType type) async {

  }

  Future<List<TaskModel>> getUserDailyTasks(String userId) async {
    return [
      TaskModel(name: "Buy bread & milk"),
    ];
  }

  Future<List<TaskModel>> getUserWeekTasks(String userId) async {
    return [
      TaskModel(name: "Walk 10000 steps"),
      TaskModel(name: "Talk with car Insurance"),
      TaskModel(name: "Buy tickets for concert"),
    ];
  }

}