import 'package:flutter/material.dart';
import 'package:goal_task/src/application/data/model/task_model.dart';
import 'package:goal_task/src/application/presentation/drawers/app_drawer.dart';
import 'state/home_screen_bloc.dart';
import 'package:goal_task/src/application/presentation/widgets/items/task_item.dart';
import 'package:goal_task/src/core/consts/app_colors.dart';
import 'package:goal_task/src/core/enums.dart';
import 'package:goal_task/src/core/injector_container.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'state/home_screen_events.dart';
import 'package:goal_task/src/core/utils/router.dart';

// import 'package:goal_task/src/application/presentation/screens/goal_screen/goal_screen.dart';

typedef TasksBlocBuilder = SealedBlocBuilder4<HomeCubit, BaseHomeState, Initial,
    Loading, Success, Failure>;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeCubit dayBloc = sl.get<HomeCubit>();
  final HomeCubit weekBloc = sl.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      dayBloc.getTasks("userId", TaskType.day);
      weekBloc.getTasks("userId", TaskType.week);
    });

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _appBar(),
            Expanded(child: _body((context))),
          ],
        ),
        drawer: AppDrawerNavigation(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(child: _daySection()),
          const SizedBox(height: 12),
          Expanded(child: _weekSection()),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _monthTile()),
              const SizedBox(width: 20),
              Expanded(child: _stateTile()),
            ],
          ),
          const SizedBox(height: 12),
          _addGoalTile(context),
        ],
      ),
    );
  }

  Widget _daySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Today's Tasks",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Expanded(
          child: Card(
            color: AppColors.todayBgColor,
            child: TasksBlocBuilder(
              bloc: dayBloc,
              builder: (ctx, states) => states(
                (initial) => const Center(child: Text('')),
                (loading) => const Center(child: CircularProgressIndicator()),
                (success) => _tasksList(success.tasks),
                (failure) => Text('Failure: ${failure.message}'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _weekSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Tasks this week",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Expanded(
          child: Card(
            child: TasksBlocBuilder(
              bloc: weekBloc,
              builder: (ctx, states) => states(
                (initial) => const Center(child: Text('')),
                (loading) => const Center(child: CircularProgressIndicator()),
                (success) => _tasksList(success.tasks),
                (failure) => Text('Failure: ${failure.message}'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _tasksList(List<TaskModel> tasks) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (ctx, index) {
        return TaskItem(task: tasks[index]);
      },
      itemCount: tasks.length,
    );
  }

  Widget _monthTile() {
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Month",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _stateTile() {
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Stats",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _addGoalTile(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesNames.goal);
        },
        child: const Text("Add Goal",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
