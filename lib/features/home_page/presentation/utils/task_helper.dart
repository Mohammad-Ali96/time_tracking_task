import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracking/core/presentation/resources/color_repository.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/task_type.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';
import 'package:time_tracking/gen/assets.gen.dart';

class TaskHelper{

  static String getPreviousTxt(TaskInfo task,IntervalEnum interval) {
    switch(interval){
      case IntervalEnum.daily:
        return '${'yesterday'.tr()} - ${task.timeFrames.daily.current}';
      case IntervalEnum.weekly:
        return '${'last_week'.tr()} - ${task.timeFrames.weekly.current}';
      case IntervalEnum.monthly:
        return '${'last_month'.tr()} - ${task.timeFrames.monthly.current}';
    }
  }


  static String getCurrentHours(TaskInfo task,IntervalEnum interval) {
    switch(interval){
      case IntervalEnum.daily:
        return task.timeFrames.daily.current.toString();
      case IntervalEnum.weekly:
        return task.timeFrames.weekly.current.toString();
      case IntervalEnum.monthly:
        return task.timeFrames.monthly.current.toString();
    }
  }


  static Color getBackgroundColor(TaskType type) {
    switch (type) {
      case TaskType.work:
        return ColorRepository.lightRedWork;
      case TaskType.play:
        return ColorRepository.softBluePlay;
      case TaskType.study:
        return ColorRepository.lightRedStudy;
      case TaskType.exercise:
        return ColorRepository.limeGreen;
      case TaskType.social:
        return ColorRepository.violet;
      case TaskType.selfCare:
        return ColorRepository.softOrange;
      default:
        return ColorRepository.lightRedWork;
    }
  }


  static String getIconTask(TaskType type) {
    switch (type) {
      case TaskType.work:
        return Assets.icons.task.iconWork;
      case TaskType.play:
        return Assets.icons.task.iconPlay;
      case TaskType.study:
        return Assets.icons.task.iconStudy;
      case TaskType.exercise:
        return Assets.icons.task.iconExercise;
      case TaskType.social:
        return Assets.icons.task.iconSocial;
      case TaskType.selfCare:
        return Assets.icons.task.iconSelfCare;
      default:
        return Assets.icons.task.iconWork;
    }
  }


}