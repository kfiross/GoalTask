import 'package:get_it/get_it.dart';
import 'package:goal_task/src/application/data/datasource/tasks_local_datasource.dart';
import 'package:goal_task/src/application/data/datasource/tasks_remote_datasource.dart';
import 'package:goal_task/src/application/data/repository/tasks_repository.dart';
import 'package:goal_task/src/application/presentation/screens/home_screen/state/home_screen_bloc.dart';

/// This is our global ServiceLocator
GetIt sl = GetIt.instance;

Future<void> initLocator() async {
  // Repository
  sl.registerLazySingleton(
      () => TasksRepository(localDatasource: sl.get(), remoteDataSource: sl.get()));

  // Data sources
  sl.registerLazySingleton(() => TasksLocalDatasource());//dailyTasksBox: sl.get(), weekTasksBox: sl.get()));
  sl.registerLazySingleton(() => TasksRemoteDatasource());

  // Bloc
  sl.registerFactory(() => HomeCubit(sl.get()));

  // External
  // sl.registerSingleton(Hive.box('daily_tasks'));
  // sl.registerSingleton(Hive.box('week_tasks'));
}
