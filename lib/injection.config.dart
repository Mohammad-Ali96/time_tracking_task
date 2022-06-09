// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import 'core/data/utils/configuration.dart' as _i3;
import 'core/data/utils/network/network_info.dart' as _i9;
import 'core/domain/utils/network/network_info.dart' as _i8;
import 'core/presentation/utils/message_utils.dart' as _i7;
import 'injectable_module.dart' as _i11;

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
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i6.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i7.MessageUtils>(() => _i7.MessageUtils());
  gh.lazySingleton<_i8.NetworkInfo>(
      () => _i9.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i10.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  return get;
}

class _$InjectableModule extends _i11.InjectableModule {}
