import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking/core/presentation/widgets/error_view.dart';
import 'package:time_tracking/core/presentation/widgets/loader.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';
import 'package:time_tracking/features/home_page/presentation/blocs/task_list/task_list_bloc.dart';
import 'package:time_tracking/features/home_page/presentation/widgets/task_widget.dart';
import 'package:time_tracking/injection.dart';

class TaskTab extends StatefulWidget {
  final IntervalEnum interval;

  const TaskTab({
    Key? key,
    required this.interval,
  }) : super(key: key);

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
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
      child: Column(
        children: [
          Expanded(
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
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                      state.tasks.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: TaskWidget(
                            task: state.tasks.elementAt(index),
                            interval: widget.interval,
                          ),
                        );
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )),
        ],
      ),
    );
  }
}
