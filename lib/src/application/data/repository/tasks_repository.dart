import 'package:goal_task/src/application/data/datasource/tasks_local_datasource.dart';
import 'package:goal_task/src/application/data/datasource/tasks_remote_datasource.dart';
import 'package:goal_task/src/application/data/model/task_model.dart';
import 'package:goal_task/src/core/enums.dart';

class TasksRepository{
  final TasksLocalDatasource localDatasource;
  final TasksRemoteDatasource remoteDataSource;

  TasksRepository({required this.localDatasource, required this.remoteDataSource});

  Future<List<TaskModel>> getUserTasks({required String userId, required TaskType type}) async{
    bool isCached = false;

    List<TaskModel> tasks = [];
    switch(type){
      case TaskType.day:
        isCached = localDatasource.isDailyCached();
        if(!isCached){
          tasks = await remoteDataSource.getUserDailyTasks(userId);
          localDatasource.cacheUserDailyTasks(tasks);
        }
        else{
          tasks = localDatasource.getUserDailyTasks(userId);
        }
        break;
      case TaskType.week:
        isCached = localDatasource.isWeekCached();
        if(!isCached){
          tasks = await remoteDataSource.getUserWeekTasks(userId);
          localDatasource.cacheUserWeekTasks(tasks);
        }
        else{
          tasks = localDatasource.getUserWeekTasks(userId);
        }
        break;
    }
    return tasks;
  }
}