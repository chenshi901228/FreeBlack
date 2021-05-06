import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/homeCubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/indexCubit.dart';
import '../../cubit/homeCubit.dart';
import '../../config/routes.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  void _login() {
    print("login");
    Routes.router.navigateTo(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexCubit, int>(
      builder: (context, indexCount) {
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
