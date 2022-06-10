import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracking/core/presentation/resources/color_repository.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';
import 'package:time_tracking/features/home_page/presentation/utils/task_helper.dart';
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
        height: 190.h,
        decoration: BoxDecoration(
          color: TaskHelper.getBackgroundColor(task.title),
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
                    TaskHelper.getIconTask(task.title),
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 144.h,
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
                            '${TaskHelper.getCurrentHours(task, interval) } ${'hrs'.tr()}',

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            TaskHelper.getPreviousTxt(task, interval) + 'hrs'.tr(),
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






}
