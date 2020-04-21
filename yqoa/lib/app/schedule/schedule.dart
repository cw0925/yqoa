import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  ScheduleState createState() => new ScheduleState();
}

class ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("日程"),
          backgroundColor: Color.fromARGB(255, 119, 136, 213), //设置appbar背景颜色
          centerTitle: true, //设置标题是否局中
        ),
        body: new Center(
          child: new Text('日程'),
        ),
      ),
    );
  }
}