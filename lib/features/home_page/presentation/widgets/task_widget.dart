import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracking/core/presentation/resources/color_repository.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/task_type.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';
import 'package:time_tracking/gen/assets.gen.dart';

class TaskWidget extends StatelessWidget {
  final TaskInfo task;
  final IntervalEnum interval;
  const TaskWidget({
    Key? key,
    required this.task,
    required this.interval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220.h,
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              top: -8,
              right: 8,
              child: Row(
                children: [
                  SvgPicture.asset(
                    _getIconTask(task.title),
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 174.h,
                width: MediaQuery.of(context).size.width - 32,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorRepository.darkBlue,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            task.title.name.tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.icons.general.iconEllipsis,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${_getCurrentHours() } ${'hrs'.tr()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            _getPreviousTxt() + 'hrs'.tr(),
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  String _getIconTask(TaskType type) {
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


  Color _getBackgroundColor() {
    TaskType type = task.title;
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

  String _getCurrentHours() {
    switch(interval){
      case IntervalEnum.daily:
        return task.timeFrames.daily.current.toString();
      case IntervalEnum.weekly:
        return task.timeFrames.weekly.current.toString();
      case IntervalEnum.monthly:
        return task.timeFrames.monthly.current.toString();
    }
  }

  String _getPreviousTxt() {
    switch(interval){
      case IntervalEnum.daily:
        return '${'yesterday'.tr()} - ${task.timeFrames.daily.current}';
      case IntervalEnum.weekly:
        return '${'last_week'.tr()} - ${task.timeFrames.weekly.current}';
      case IntervalEnum.monthly:
        return '${'last_month'.tr()} - ${task.timeFrames.monthly.current}';
    }
  }

}
