import 'package:flutter/material.dart';

class AddressBook extends StatefulWidget {
  @override
  AddressBookState createState() => new AddressBookState();
}

class AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("通讯录"),
          backgroundColor: Color.fromARGB(255, 119, 136, 213), //设置appbar背景颜色
          centerTitle: true, //设置标题是否局中
        ),
        body: new Center(
          child: new Text('通讯录'),
        ),
      ),
    );
  }
}