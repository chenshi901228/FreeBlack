import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../view/splash/splashPage.dart';
import '../view/login/login.dart';
import '../view/home/index.dart';
import '../view/home/home.dart';

// token验证
_routerBefore(BuildContext context, Widget route) {
  final String _token = ""; //token
  bool _isOpenVerify = true; //是否开启验证
  if (_token.isNotEmpty || !_isOpenVerify) {
    return route;
  } else {
    return Login();
  }
}

//闪屏页
var splashPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SplashPage();
});
//登录
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Login();
});
//主页
var indexPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return _routerBefore(context, IndexPage());
});
//tab页
var homePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return _routerBefore(context, HomePage());
});
