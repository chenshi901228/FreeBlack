import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = "192.168.2.160:80"; //本地服务器地址，需要将localhost换成本机ip地址

class HttpUtils {
  ///post请求
  static Future post({@required String url, Map params = const {}}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token") ?? "";
    var requestUrl = Uri.http(baseUrl, url);
    try {
      return await http.Client()
          .post(requestUrl,
              headers: {"Authorization": "Bearer " + token},
              body: json.encode(params))
          .then((res) => json.decode(res.body));
    } catch (err) {
      return err;
    }
  }

  ///get请求
  static Future get({@required String url}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token") ?? "";
    var requestUrl = Uri.http(baseUrl, url);
    try {
      return await http.Client().get(requestUrl, headers: {
        "Authorization": "Bearer " + token
      }).then((res) => json.decode(res.body));
    } catch (err) {
      return err;
    }
  }
}
