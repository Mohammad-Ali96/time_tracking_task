import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracking/core/presentation/resources/color_repository.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';
import 'package:time_tracking/features/home_page/domain/entities/task_info.dart';
import 'package:time_tracking/features/home_page/presentation/utils/task_helper.dart';
import 'package:time_tracking/gen/assets.gen.dart';

class DesktopTaskWidget extends StatefulWidget {
  final TaskInfo task;
  final IntervalEnum interval;
  const DesktopTaskWidget({
    Key? key,
    required this.task,
    required this.interval,
  }) : super(key: key);

  @override
  State<DesktopTaskWidget> createState() => _DesktopTaskWidgetState();
}

class _DesktopTaskWidgetState extends State<DesktopTaskWidget> {
  bool isHovered = false;


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event){
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event){
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: TaskHelper.getBackgroundColor(widget.task.title),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -8,
                right: 8,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      TaskHelper.getIconTask(widget.task.title),
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isHovered ? ColorRepository.desaturatedBlue : ColorRepository.darkBlue,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.task.title.name.tr(),
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
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${TaskHelper.getCurrentHours(widget.task, widget.interval) } ${'hrs'.tr()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            TaskHelper.getPreviousTxt(widget.task, widget.interval) + 'hrs'.tr(),
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
