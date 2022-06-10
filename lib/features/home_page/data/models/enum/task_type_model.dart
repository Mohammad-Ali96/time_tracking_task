import 'package:json_annotation/json_annotation.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/task_type.dart';

enum TaskTypeModel {
  @JsonValue('Work')
  work,
  @JsonValue('Play')
  play,
  @JsonValue('Study')
  study,
  @JsonValue('Exercise')
  exercise,
  @JsonValue('Social')
  social,
  @JsonValue('Self Car')
  selfCar
}

extension MapToDomain on TaskTypeModel {
  TaskType toDomain() =>
      TaskType.values.firstWhere((element) => element.name == name);
}
