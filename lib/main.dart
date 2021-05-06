import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';

import 'config/routes.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 667),
        builder: () => MaterialApp(
              onGenerateRoute: Routes.router.generator,
            ));
  }
}
