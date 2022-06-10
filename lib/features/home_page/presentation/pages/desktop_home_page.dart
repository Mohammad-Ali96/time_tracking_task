import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_tracking/core/presentation/resources/color_repository.dart';
import 'package:time_tracking/core/presentation/widgets/screen_loader.dart';
import 'package:time_tracking/core/presentation/widgets/screen_utils.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';
import 'package:time_tracking/features/home_page/presentation/widgets/desktop_task_tab.dart';
import 'package:time_tracking/gen/assets.gen.dart';


class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  DesktopHomePageState createState() => DesktopHomePageState();
}

class DesktopHomePageState extends State<DesktopHomePage> with TickerProviderStateMixin, ScreenUtils, ScreenLoader{
  late final TabController tabController;
  @override
  void initState() {
    tabController =
        TabController(length: IntervalEnum.values.length, vsync: this);
    super.initState();
  }
  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(32),
          color: ColorRepository.doubleDarkBlue,
        child: Row(
          children: [
            Expanded(flex: 1,child: Container(
              decoration: BoxDecoration(
                  color: ColorRepository.darkBlue,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(style: BorderStyle.none)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ColorRepository.blue,
                        borderRadius: const BorderRadius.all(Radius.circular(16),),
                        border: Border.all(style: BorderStyle.none),
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 36.w,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 34.0.w,
                                  backgroundColor: ColorRepository.darkBlue,
                                  backgroundImage:
                                  AssetImage(Assets.images.jeremy.path),
                                ),
                              ),
                              SizedBox(
                                height: 16.w,
                              ),
                              Text(
                                'report_for'.tr(),
                                style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'jeremy_robson'.tr(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 186.h,
                    child: DefaultTabController(
                      length: IntervalEnum.values.length,
                      child: Column(
                        children: [
                          Expanded(
                            child: RotatedBox(

                              quarterTurns: 1,
                              child: TabBar(
                                controller: tabController,
                                indicator: const BoxDecoration(
                                  backgroundBlendMode: null,
                                ),
                                labelStyle: const TextStyle(
                                    fontSize: 12.4,
                                    fontWeight: FontWeight.w400),
                                unselectedLabelColor:
                                ColorRepository.desaturatedBlue,
//                                padding: EdgeInsets.all(0),
//                                indicatorPadding: EdgeInsets.all(0),
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: IntervalEnum.values
                                    .map(
                                      (interval) => Tab(
                                    child: RotatedBox(
                                        quarterTurns: -1,
                                        child: Text(interval.name.tr())),
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),),
            const SizedBox(
              width: 32,
            ),
            Expanded(flex: 3,child: TabBarView(
              controller: tabController,
              children: const [
                DesktopTaskTab(interval: IntervalEnum.daily),
                DesktopTaskTab(interval: IntervalEnum.weekly),
                DesktopTaskTab(interval: IntervalEnum.monthly),
              ],
            ),),

          ],
        ),
          ),
    );
  }

}
