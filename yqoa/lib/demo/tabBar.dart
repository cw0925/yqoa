/**
 * APP的主入口文件
 */

import 'package:flutter/material.dart';

import 'package:yqoa/app/oa/OA.dart';
import 'package:yqoa/app/schedule/Schedule.dart';
import 'package:yqoa/app/addressbook/Addressbook.dart';
import 'package:yqoa/app/my/My.dart';
import 'package:yqoa/app/home/Home.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => new AppState();
}

class AppState extends State<App> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new OA(),
            new Schedule(),
            new Home(),
            new AddressBook(),
            new My()
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.white,
          child: new TabBar(
            controller: controller,
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelColor: Colors.black26,
            tabs: <Widget>[
              new Tab(
                text: "待办",
                icon: new Icon(Icons.brightness_5),
              ),
              new Tab(
                text: "日程",
                icon: new Icon(Icons.brightness_5),
              ),
              new Tab(
                text: "优琪",
                icon: new Icon(Icons.brightness_5),
              ),
              new Tab(
                text: "通讯录",
                icon: new Icon(Icons.map),
              ),
              new Tab(
                text: "我的",
                icon: new Icon(Icons.directions_run),
              ),
            ],
          ),
        ),
      ),
    );
  }
}