import 'package:auto_route/auto_route.dart';
import 'package:time_tracking/features/home_page/presentation/pages/home_page.dart';

export 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [

    AutoRoute(page: HomePage, initial: true),


  ],
)
class $AppRouter {}
