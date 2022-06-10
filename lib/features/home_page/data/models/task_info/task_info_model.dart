import 'package:json_annotation/json_annotation.dart';
import 'package:time_tracking/features/home_page/data/models/enum/task_type_model.dart';
import 'package:time_tracking/features/home_page/data/models/time_frames/time_frames_model.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';

part 'task_info_model.g.dart';

@JsonSerializable()
class TaskInfoModel {
  final TimeFramesModel timeFrames;
  final TaskTypeModel title;

  TaskInfoModel({
    required this.timeFrames,
    required this.title,
  });

  factory TaskInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TaskInfoModelFromJson(json);
}

extension MapUserInfoModelToDomain on TaskInfoModel {
  TaskInfo toDomain() => TaskInfo(
        title: title.toDomain(),
        timeFrames: timeFrames.toDomain(),
      );
}
