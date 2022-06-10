import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:time_tracking/core/data/utils/configuration.dart';
import 'package:time_tracking/features/home_page/data/models/task_info/task_info_model.dart';

part 'home_remote_data_source.g.dart';

abstract class HomeRemoteDataSource {
  Future<List<TaskInfoModel>> getTasks();

}

@LazySingleton(as: HomeRemoteDataSource)
@RestApi(baseUrl: '')
abstract class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @factoryMethod
  factory HomeRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _HomeRemoteDataSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @override
  @GET('/time-tracking')
  Future<List<TaskInfoModel>> getTasks();

}
