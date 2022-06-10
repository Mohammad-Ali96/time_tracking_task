import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_tracking/core/presentation/resources/color_repository.dart';
import 'package:time_tracking/core/presentation/widgets/screen_loader.dart';
import 'package:time_tracking/core/presentation/widgets/screen_utils.dart';
import 'package:time_tracking/gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with ScreenUtils, ScreenLoader {
  @override
  void initState() {
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
                    Container(
//                      color: Colors.red,
                      height: 86.h,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
