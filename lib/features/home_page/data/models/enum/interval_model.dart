
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';

enum IntervalEnumModel { daily, weekly, monthly }

extension MapToDomain on IntervalEnumModel {
  IntervalEnum toDomain() =>
      IntervalEnum.values.firstWhere((element) => element.name == name);
}
