import 'package:goal_task/src/application/data/model/task_model.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

class BaseHomeState extends Union4Impl<Initial, Loading, Success, Failure> {
  BaseHomeState._(Union4<Initial, Loading, Success, Failure> union) : super(union);

  /// Initial state before any events are added.
  factory BaseHomeState.initial() => BaseHomeState._(unions.first(Initial()));

  /// State while data is being loaded asynchronously.
  factory BaseHomeState.loading() => BaseHomeState._(unions.second(Loading()));

  /// State when data has been sucessfully loaded.
  factory BaseHomeState.success({required List<TaskModel> tasks}) =>
      BaseHomeState._(unions.third(Success(tasks: tasks)));

  /// State when data load has failed.
  factory BaseHomeState.failure({required String message}) =>
      BaseHomeState._(unions.fourth(Failure(message: message)));

  /// [Quartet] unions.
  static const unions = Quartet<Initial, Loading, Success, Failure>();
}

class Initial {}

class Loading {}

class Success {
  final List<TaskModel> tasks;

  Success({required this.tasks});
}

class Failure {
  final String message;

  Failure({required this.message});
}
