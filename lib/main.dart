import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes.dart';
// import 'observer/index_observer.dart';
import 'cubit/indexCubit.dart';
import 'cubit/homeCubit.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  // Bloc.observer = IndexObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 667),
        builder: () => MultiBlocProvider(
                providers: [
                  BlocProvider<IndexCubit>(
                      create: (BuildContext context) => IndexCubit()),
                  BlocProvider<HomeCubit>(
                      create: (BuildContext context) => HomeCubit())
                ],
                child: MaterialApp(
                  onGenerateRoute: Routes.router.generator,
                )));
  }
}
