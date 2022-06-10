import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracking/core/presentation/resources/color_repository.dart';
import 'package:time_tracking/core/presentation/widgets/screen_loader.dart';
import 'package:time_tracking/core/presentation/widgets/screen_utils.dart';
import 'package:time_tracking/features/home_page/domain/enum/interval.dart';
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
                  children: [
                    ListView(
                      children: [
                        Container(
                            height: 220.h,
                            decoration: BoxDecoration(
                              color: ColorRepository.lightRedWork,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Positioned(
                                  top: -10,
                                  right: 10,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.icons.task.iconWork,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: 174.h,
                                    width:
                                        MediaQuery.of(context).size.width - 32,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: ColorRepository.darkBlue,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Flexible(
                                              child: Text(
                                                'Play',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: SvgPicture.asset(
                                                Assets
                                                    .icons.general.iconEllipsis,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Flexible(
                                              child: Text(
                                                '32hrs',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                'Last Week - 8hrs',
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
                            )),
                      ],
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
