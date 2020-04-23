import 'package:flutter/material.dart';
import 'package:yqoa/app/app.dart';
import 'package:yqoa/app/home/crm.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,  //去除右上角的Debug标签
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "/crm": (BuildContext context) => CRM(),  //主页面
      },
      home: MainPage(), //启动MainPage
    );
  }
}
