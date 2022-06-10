import 'package:json_annotation/json_annotation.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_duration.dart';

part 'task_duration_model.g.dart';

@JsonSerializable()
class TaskDurationModel {
  @JsonKey(name: 'current', defaultValue: 0)
  final int current;
  @JsonKey(name: 'previous', defaultValue: 0)
  final int previous;

  TaskDurationModel({
    required this.current,
    required this.previous,
  });

  factory TaskDurationModel.fromJson(Map<String, dynamic> json) =>
      _$TaskDurationModelFromJson(json);
}

extension MapUserInfoModelToDomain on TaskDurationModel {
  TaskDuration toDomain() => TaskDuration(current: current, previous: previous);
}
