import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './route_handlers.dart';

class Routes {
  static FluroRouter router;
  static String root = '/'; //进入闪屏页
  static String loginPage = '/login'; //登录页
  static String indexPage = '/index'; //主页
  static String homePage = '/home'; //  tab首页

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: splashPageHandler);
    router.define(loginPage, handler: loginHandler);
    router.define(indexPage, handler: indexPageHandler);
    router.define(homePage, handler: homePageHandler);

    Routes.router = router;
  }
}
