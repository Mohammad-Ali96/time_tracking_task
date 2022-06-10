import 'package:json_annotation/json_annotation.dart';
import 'package:time_tracking/features/home_page/data/models/task_duration/task_duration_model.dart';
import 'package:time_tracking/features/home_page/domain/entities/time_frames.dart';

part 'time_frames_model.g.dart';

@JsonSerializable()
class TimeFramesModel {
  final TaskDurationModel daily;
  final TaskDurationModel weekly;
  final TaskDurationModel monthly;

  TimeFramesModel({
    required this.daily,
    required this.weekly,
    required this.monthly,
  });

  factory TimeFramesModel.fromJson(Map<String, dynamic> json) =>
      _$TimeFramesModelFromJson(json);
}

extension MapUserInfoModelToDomain on TimeFramesModel {
  TimeFrames toDomain() => TimeFrames(
        daily: daily.toDomain(),
        weekly: weekly.toDomain(),
        monthly: monthly.toDomain(),
      );
}
