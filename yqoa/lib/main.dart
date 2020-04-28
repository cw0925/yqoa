import 'package:flutter/material.dart';
import 'package:yqoa/app/login/Login.dart';
import 'package:yqoa/app/App.dart';

import 'package:yqoa/app/home/CRM.dart';
import 'package:yqoa/app/home/Business.dart';
import 'package:yqoa/app/home/Finance.dart';
import 'package:yqoa/app/home/Person.dart';
import 'package:yqoa/app/home/Admin.dart';
import 'package:yqoa/app/home/Service.dart';
import 'package:yqoa/app/home/Test.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,  //去除右上角的Debug标签
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(), //启动MainPage
      routes: <String, WidgetBuilder>{
        "/crm": (BuildContext context) => CRM(),  //主页面
        "/business": (BuildContext context) => Business(),  //主页面
        "/finance": (BuildContext context) => Finance(),  //主页面
        "/person": (BuildContext context) => Person(),  //主页面
        "/admin": (BuildContext context) => Admin(),  //主页面
        "/service": (BuildContext context) => Service(),  //主页面
        "/test": (BuildContext context) => TestPage()  //主页面
      },
    );
  }
}
