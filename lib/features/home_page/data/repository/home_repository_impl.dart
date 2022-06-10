import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:time_tracking/core/data/repositories/base_repository_impl.dart';
import 'package:time_tracking/core/domain/entities/failures.dart';
import 'package:time_tracking/core/domain/usecases/usecase.dart';
import 'package:time_tracking/core/domain/utils/network/network_info.dart';
import 'package:time_tracking/features/home_page/data/datasources/remote/home_remote_data_source.dart';
import 'package:time_tracking/features/home_page/data/models/task_info/task_info_model.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';
import 'package:time_tracking/features/home_page/domain/repository/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends BaseRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;
  final NetworkInfo networkInfo;
  final Logger logger;

  HomeRepositoryImpl(this.remote, this.networkInfo, this.logger)
      : super(networkInfo, logger);

  @override
  Future<Either<Failure, List<TaskInfo>>> getTasks(NoParams params) {
    return request(() async {
      final response = await remote.getTasks();
      return right(response.map((e) => e.toDomain()).toList());
    });
  }
}
