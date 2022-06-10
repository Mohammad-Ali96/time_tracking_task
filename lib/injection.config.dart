// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import 'core/data/utils/configuration.dart' as _i3;
import 'core/data/utils/network/network_info.dart' as _i10;
import 'core/domain/utils/network/network_info.dart' as _i9;
import 'core/presentation/utils/message_utils.dart' as _i8;
import 'features/home_page/data/datasources/remote/home_remote_data_source.dart'
    as _i5;
import 'features/home_page/data/repository/home_repository_impl.dart' as _i13;
import 'features/home_page/domain/repository/home_repository.dart' as _i12;
import 'features/home_page/domain/usecases/get_tasks_list_use_case.dart'
    as _i14;
import 'features/home_page/presentation/blocs/task_list/task_list_bloc.dart'
    as _i15;
import 'injectable_module.dart' as _i16;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Configuration>(() => _i3.DevConfiguration(),
      registerFor: {_dev});
  gh.lazySingleton<_i3.Configuration>(() => _i3.StagingConfiguration(),
      registerFor: {_staging});
  gh.lazySingleton<_i3.Configuration>(() => _i3.ProductionConfiguration(),
      registerFor: {_prod});
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i5.HomeRemoteDataSource>(() =>
      _i5.HomeRemoteDataSourceImpl(get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i6.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i7.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i8.MessageUtils>(() => _i8.MessageUtils());
  gh.lazySingleton<_i9.NetworkInfo>(
      () => _i10.NetworkInfoImpl(get<_i6.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i11.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i12.HomeRepository>(() => _i13.HomeRepositoryImpl(
      get<_i5.HomeRemoteDataSource>(),
      get<_i9.NetworkInfo>(),
      get<_i7.Logger>()));
  gh.lazySingleton<_i14.GetTasksListUseCase>(
      () => _i14.GetTasksListUseCase(get<_i12.HomeRepository>()));
  gh.factory<_i15.TaskListBloc>(() =>
      _i15.TaskListBloc(getTasksListUseCase: get<_i14.GetTasksListUseCase>()));
  return get;
}

class _$InjectableModule extends _i16.InjectableModule {}
