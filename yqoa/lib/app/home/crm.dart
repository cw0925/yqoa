import 'package:flutter/material.dart';

class CRM extends StatefulWidget {
  @override
  CRMState createState() => new CRMState();
}

class CRMState extends State<CRM> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("CRM"),
          backgroundColor: Color.fromARGB(255, 119, 136, 213), //设置appbar背景颜色
          centerTitle: true, //设置标题是否局中
        ),
        body: new Center(
          child: new Text('首页'),
        ),
      ),
    );
  }
}