import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:time_tracking/core/domain/entities/failures.dart';
import 'package:time_tracking/core/domain/usecases/usecase.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking/features/home_page/domain/usecases/get_tasks_list_use_case.dart';

part 'task_list_event.dart';

part 'task_list_state.dart';

@injectable
class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  final GetTasksListUseCase getTasksListUseCase;

  TaskListBloc({
    required this.getTasksListUseCase,
  }) : super(TaskListInitial()) {
    on<TaskListGetList>(
      (event, emit) async {
        emit(TaskListLoading());

        final result = await getTasksListUseCase(NoParams());

        emit(
          result.fold(
            (l) => TaskListFailure(failure: l),
            (r) => TaskListSuccess(tasks: r),
          ),
        );
      },
    );
  }
}
