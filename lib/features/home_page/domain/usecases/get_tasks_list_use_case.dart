import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:time_tracking/core/domain/entities/failures.dart';
import 'package:time_tracking/core/domain/usecases/usecase.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';
import 'package:time_tracking/features/home_page/domain/repository/home_repository.dart';

@lazySingleton
class GetTasksListUseCase extends UseCase<List<TaskInfo>, NoParams> {
  final HomeRepository repository;

  GetTasksListUseCase(this.repository);

  @override
  Future<Either<Failure, List<TaskInfo>>> call(NoParams params) {
    return repository.getTasks(params);
  }
}
