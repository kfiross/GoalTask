import 'package:goal_task/src/application/data/model/task_model.dart';
import 'package:hive/hive.dart';

class TasksLocalDatasource{
  // final Box dailyTasksBox;
  // final Box weekTasksBox;

  //TasksLocalDatasource({required this.dailyTasksBox, required this.weekTasksBox});
  TasksLocalDatasource();

  Future<void> cacheUserDailyTasks(List<TaskModel> tasks) async {
    Box dailyTasksBox = Hive.box('daily_tasks');
    dailyTasksBox.addAll(tasks.map((e) => e.toJSON()));
  }

  Future<void> cacheUserWeekTasks(List<TaskModel> tasks) async {
    Box weekTasksBox = Hive.box('week_tasks');
    weekTasksBox.addAll(tasks.map((e) => e.toJSON()));
  }

  List<TaskModel> getUserDailyTasks(String userId)  {
    Box dailyTasksBox = Hive.box('daily_tasks');
    return dailyTasksBox.values.map((e) => TaskModel.fromJSON(e)).toList();
  }

  List<TaskModel> getUserWeekTasks(String userId)  {
    Box weekTasksBox = Hive.box('week_tasks');
    return weekTasksBox.values.map((e) => TaskModel.fromJSON(e)).toList();
  }

  bool isDailyCached() {
    Box dailyTasksBox = Hive.box('daily_tasks');
    return dailyTasksBox.isNotEmpty;
  }

  bool isWeekCached() {
    Box weekTasksBox = Hive.box('week_tasks');
    return weekTasksBox.isNotEmpty;
  }

}