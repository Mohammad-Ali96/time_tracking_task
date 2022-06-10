import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:time_tracking/core/domain/entities/failures.dart';
import 'package:time_tracking/core/domain/usecases/usecase.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<TaskInfo>>> getTasks(NoParams params);
}
