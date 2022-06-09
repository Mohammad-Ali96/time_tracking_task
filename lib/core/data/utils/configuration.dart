import 'package:time_tracking/core/domain/utils/app_environment.dart';
import 'package:injectable/injectable.dart';

abstract class Configuration {
  String get getBaseUrl;

}

@LazySingleton(as: Configuration, env: [AppEnvironment.dev])
class DevConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://wookie.codesubmit.io/time-tracking';

}

@LazySingleton(as: Configuration, env: [AppEnvironment.staging])
class StagingConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://wookie.codesubmit.io/time-tracking';

}

@LazySingleton(as: Configuration, env: [AppEnvironment.prod])
class ProductionConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://wookie.codesubmit.io/time-tracking';

}
