import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking/core/presentation/widgets/error_view.dart';
import 'package:time_tracking/core/presentation/widgets/loader.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';
import 'package:time_tracking/features/home_page/presentation/blocs/task_list/task_list_bloc.dart';
import 'package:time_tracking/features/home_page/presentation/widgets/desktop_task_widget.dart';
import 'package:time_tracking/injection.dart';

class DesktopTaskTab extends StatefulWidget {
  final IntervalEnum interval;

  const DesktopTaskTab({
    Key? key,
    required this.interval,
  }) : super(key: key);

  @override
  State<DesktopTaskTab> createState() => _DesktopTaskTabState();
}

class _DesktopTaskTabState extends State<DesktopTaskTab> {
  final TaskListBloc taskListBloc = getIt<TaskListBloc>();

  @override
  void initState() {
    taskListBloc.add(TaskListGetList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        taskListBloc.add(TaskListGetList());
      },
      child: BlocBuilder<TaskListBloc, TaskListState>(
        bloc: taskListBloc,
        builder: (context, state) {
          if (state is TaskListLoading) {
            return const Loader();
          } else if (state is TaskListFailure) {
            return Center(
              child: ErrorView(
                failure: state.failure,
                onRetry: () {
                  taskListBloc.add(TaskListGetList());
                },
              ),
            );
          } else if (state is TaskListSuccess) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 22,
              mainAxisSpacing: 22,
              children: state.tasks.map((task) => DesktopTaskWidget(
                task: task,
                interval: widget.interval,
              )).toList(),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      )
    );
  }
}
