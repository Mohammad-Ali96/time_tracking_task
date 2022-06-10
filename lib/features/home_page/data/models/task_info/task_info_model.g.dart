// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskInfoModel _$TaskInfoModelFromJson(Map<String, dynamic> json) =>
    TaskInfoModel(
      timeFrames:
          TimeFramesModel.fromJson(json['timeFrames'] as Map<String, dynamic>),
      title: $enumDecode(_$TaskTypeModelEnumMap, json['title']),
    );

Map<String, dynamic> _$TaskInfoModelToJson(TaskInfoModel instance) =>
    <String, dynamic>{
      'timeFrames': instance.timeFrames,
      'title': _$TaskTypeModelEnumMap[instance.title],
    };

const _$TaskTypeModelEnumMap = {
  TaskTypeModel.work: 'Work',
  TaskTypeModel.play: 'Play',
  TaskTypeModel.study: 'Study',
  TaskTypeModel.exercise: 'Exercise',
  TaskTypeModel.social: 'Social',
  TaskTypeModel.selfCar: 'Self Car',
};
