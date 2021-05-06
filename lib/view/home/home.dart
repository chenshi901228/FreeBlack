import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../config/routes.dart';
import '../../cubit/indexCubit.dart';
import '../../cubit/homeCubit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<IndexCubit, int>(
      builder: (context, indexCount) {
        return BlocBuilder<HomeCubit, int>(builder: (context, homeCount) {
          return Scaffold(
            appBar: AppBar(
              title: Text('homePage'),
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
                    onTap: () => {Routes.router.navigateTo(context, '/index')},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                          vertical: ScreenUtil().setWidth(4)),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.6),
                      ),
                      child: Text(
                        'toindex',
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
