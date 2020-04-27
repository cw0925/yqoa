import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/MainAppbar.dart';

class OA extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  OAPage(title: 'Flutter Demo Home Page');
  }
}

class OAPage extends StatefulWidget {
  OAPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OAPageState createState() => _OAPageState();
}

class _OAPageState extends State<OAPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: '待办事项',
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
