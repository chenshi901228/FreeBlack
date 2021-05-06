import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  void _login() {
    print("login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('indexPage'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('this is indexPage!'),
            Text('hey! 欢迎!'),
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
                  '登录',
                  style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
