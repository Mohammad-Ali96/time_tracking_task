import 'package:flutter/services.dart';
import 'package:time_tracking/core/domain/utils/app_environment.dart';
import 'package:time_tracking/injection.dart';
import 'package:time_tracking/src/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:desktop_window/desktop_window.dart';
import 'dart:io' show Platform;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureInjection(AppEnvironment.dev);


  if(Platform.isWindows){
    await DesktopWindow.setMinWindowSize(const Size(1440,600));
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const App(),
    ),
  );
}
