import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/routes.dart';

import '../../model/splashModel.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _countDown = 5; //倒计时间
  Timer _timer; //计时器
  bool _isShow = false; //闪屏页是否加载完成
  ImageProvider _addImageLoadListener(String url) {
    Image image = Image.network(url);
    image.image
        .resolve(ImageConfiguration.empty)
        .addListener(ImageStreamListener((info, synchronousCall) {
          if (!_isShow) {
            setState(() {
              _isShow = true;
            });
            _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
              setState(() {
                _countDown--;
              });
              if (_countDown == 0) {
                _timer.cancel();
                _toIndex();
              }
            });
          }
        }, onChunk: (event) {
          // 也可以这样
          /*if(event.cumulativeBytesLoaded/event.expectedTotalBytes>=1){
            _adEvent(1);
          }*/
        }, onError: (_, __) {}));
    return image.image;
  }

  void _toIndex() {
    Routes.router.navigateTo(context, "/index",
        clearStack: true, transition: TransitionType.fadeIn);
    _timer?.cancel();
  }

  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Stack(
            children: [
              Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: FadeInImage(
                    placeholder: AssetImage("images/test.png"),
                    fit: BoxFit.fill,
                    image: _addImageLoadListener(SplashPageImgs.backfroundImg)),
              ),
              Positioned(
                  bottom: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(20),
                  child: Offstage(
                    offstage: !_isShow,
                    child: GestureDetector(
                        onTap: () {
                          _toIndex();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(20),
                              vertical: ScreenUtil().setWidth(4)),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenUtil().setWidth(16)))),
                          child: Text(
                            "$_countDown s 跳过",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.white),
                          ),
                        )),
                  )),
            ],
          )),
    );
  }
}
