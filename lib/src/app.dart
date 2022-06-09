import 'package:time_tracking/core/presentation/resources/app_color_scheme.dart';
import 'package:time_tracking/core/presentation/resources/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:time_tracking/core/presentation/routes/app_router.dart' as router;


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = router.AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, c) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
          return MaterialApp.router(
            title: 'Time Tracking',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppTheme(AppLightColorScheme()).getThemeData(context),
            darkTheme: AppTheme(AppDarkColorScheme()).getThemeData(context),
            themeMode: ThemeMode.light,
            builder: (context, widget) {
              return Builder(builder: (context) {
                if (widget == null) {
                  return Container();
                }
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(
                      physics: const BouncingScrollPhysics(),
                    ),
                    child: SafeArea(
                      top: false,
                      left: false,
                      right: false,
                      child: widget,
                    ),
                  ),
                );
              });
            },
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        });
  }
}
