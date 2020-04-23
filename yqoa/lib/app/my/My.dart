import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/MainAppbar.dart';

class My extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyPage(title: 'Flutter Demo Home Page');
  }
}

class MyPage extends StatefulWidget {
  MyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: '个人中心',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
                'Hello'
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
