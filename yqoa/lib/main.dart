import 'package:flutter/material.dart';
import 'package:yqoa/app/app.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(), //启动MainPage
    );
  }
}
