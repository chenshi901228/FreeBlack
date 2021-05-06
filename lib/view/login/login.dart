import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _toIndexPage() {
    // Fluttertoast.showToast(msg: "msg");
    Routes.router.navigateTo(context, '/index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'login',
            style: TextStyle(fontSize: ScreenUtil().setSp(18)),
          ),
          GestureDetector(
            onTap: () => {_toIndexPage()},
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(12),
                  vertical: ScreenUtil().setWidth(8)),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil().setWidth(10)))),
              child: Text(
                'toIndexPage',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Image.network(
            "https://picsum.photos/360/700?random=1",
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setWidth(100),
            fit: BoxFit.fill,
          )
        ],
      )),
    );
  }
}
