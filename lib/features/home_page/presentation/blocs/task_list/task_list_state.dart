part of 'task_list_bloc.dart';

@immutable
abstract class TaskListState {}

class TaskListInitial extends TaskListState {}

class TaskListLoading extends TaskListState {}

class TaskListSuccess extends TaskListState {
  final List<TaskInfo> tasks;

  TaskListSuccess({
    required this.tasks,
  });
}

class TaskListFailure extends TaskListState {
  final Failure failure;

  TaskListFailure({
    required this.failure,
  });
}
