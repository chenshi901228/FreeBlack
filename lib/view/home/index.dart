import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/homeCubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/indexCubit.dart';
import '../../cubit/homeCubit.dart';
// import '../../config/routes.dart';
// import '../../utils/httpRequest.dart';

import '../../utils/eventBus.dart';
import '../../event/demoEvent.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  void _login() async {
    // try {
    //   final data = await HttpUtils.post(url:"/cs/public/index.php/test");
    //   print(data['count']);
    // } catch (err) {
    //   print(err);
    // }
    eventBus.fire(DemoEvent(true)); //eventBus触发事件
    // print("login");
    // Routes.router.navigateTo(context, '/home');
  }

  void initState() {
    // eventBus监听事件
    eventBus.on<DemoEvent>().listen((event) {
      print(event.isClick);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexCubit, int>(
      //状态管理-获取状态
      builder: (context, indexCount) {
        //多个状态-嵌套模式
        return BlocBuilder<HomeCubit, int>(builder: (context, homeCount) {
          return Scaffold(
            appBar: AppBar(
              title: Text('indexPage'),
            ),
            body: Container(
              child: Column(
                children: [
                  Text('this is indexPage!$indexCount'),
                  Text('hey! 欢迎!$homeCount'),
                  GestureDetector(
                    onTap: () => {context.read<IndexCubit>().saySomething()},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                          vertical: ScreenUtil().setWidth(4)),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.6),
                      ),
                      child: Text(
                        'index++',
                        style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {context.read<HomeCubit>().saySomething()},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                          vertical: ScreenUtil().setWidth(4)),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.6),
                      ),
                      child: Text(
                        'home--',
                        style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {_login()},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                          vertical: ScreenUtil().setWidth(4)),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.6),
                      ),
                      child: Text(
                        'tohome',
                        style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
