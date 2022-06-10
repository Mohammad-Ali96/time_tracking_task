import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_tracking/core/presentation/resources/color_repository.dart';
import 'package:time_tracking/core/presentation/widgets/screen_loader.dart';
import 'package:time_tracking/core/presentation/widgets/screen_utils.dart';
import 'package:time_tracking/features/home_page/domain/entities/enum/interval.dart';
import 'package:time_tracking/features/home_page/presentation/widgets/task_tab.dart';
import 'package:time_tracking/gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with TickerProviderStateMixin, ScreenUtils, ScreenLoader {
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
          padding: const EdgeInsets.all(16),
          color: ColorRepository.doubleDarkBlue,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 260.h,
                decoration: BoxDecoration(
                    color: ColorRepository.darkBlue,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(style: BorderStyle.none)),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: ColorRepository.blue,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16),
                          ),
                          border: Border.all(style: BorderStyle.none),
                        ),
                        child: Row(
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
                              width: 16.w,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 86.h,
                      child: DefaultTabController(
                        length: IntervalEnum.values.length,
                        child: Column(
                          children: [
                            Expanded(
                              child: TabBar(
                                controller: tabController,
                                indicator: const BoxDecoration(
                                  backgroundBlendMode: null,
                                ),
                                labelStyle: const TextStyle(
                                    fontSize: 16,
                                    wordSpacing: 1.4,
                                    fontWeight: FontWeight.w400),
                                unselectedLabelColor:
                                    ColorRepository.desaturatedBlue,
                                tabs: IntervalEnum.values
                                    .map(
                                      (interval) => Tab(
                                        child: Text(interval.name.tr()),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    TaskTab(interval: IntervalEnum.daily),
                    TaskTab(interval: IntervalEnum.weekly),
                    TaskTab(interval: IntervalEnum.monthly),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
