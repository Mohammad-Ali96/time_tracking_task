import 'package:time_tracking/features/home_page/domain/enum/interval.dart';

enum IntervalModel { daily, weekly, monthly }

extension MapToDomain on IntervalModel {
  Interval toDomain() =>
      Interval.values.firstWhere((element) => element.name == name);
}
