// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_duration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDurationModel _$TaskDurationModelFromJson(Map<String, dynamic> json) =>
    TaskDurationModel(
      current: json['current'] as int? ?? 0,
      previous: json['previous'] as int? ?? 0,
    );

Map<String, dynamic> _$TaskDurationModelToJson(TaskDurationModel instance) =>
    <String, dynamic>{
      'current': instance.current,
      'previous': instance.previous,
    };
