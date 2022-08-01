import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_task/src/application/data/repository/tasks_repository.dart';
import 'package:goal_task/src/core/enums.dart';

import 'home_screen_events.dart';

class HomeCubit extends Cubit<BaseHomeState> {

  final TasksRepository _tasksRepository;
  HomeCubit(this._tasksRepository) : super(BaseHomeState.initial());

  void clearList(){
    emit(BaseHomeState.success(tasks: []));
  }

  void getTasks(String userId, TaskType type) async {
    emit(BaseHomeState.loading());
    await Future.delayed(const Duration(seconds: 2));
    try{
      final tasks = await _tasksRepository.getUserTasks(userId: userId, type: type);
      emit(BaseHomeState.success(tasks: tasks));

    } catch (e){
      emit(BaseHomeState.failure(message: "Error"));
    }
  }
}