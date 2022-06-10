// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_frames_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeFramesModel _$TimeFramesModelFromJson(Map<String, dynamic> json) =>
    TimeFramesModel(
      daily: TaskDurationModel.fromJson(json['daily'] as Map<String, dynamic>),
      weekly:
          TaskDurationModel.fromJson(json['weekly'] as Map<String, dynamic>),
      monthly:
          TaskDurationModel.fromJson(json['monthly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimeFramesModelToJson(TimeFramesModel instance) =>
    <String, dynamic>{
      'daily': instance.daily,
      'weekly': instance.weekly,
      'monthly': instance.monthly,
    };
