import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/MainAppbar.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SchedulePage(title: 'Flutter Demo Home Page');
  }
}

class SchedulePage extends StatefulWidget {
  SchedulePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: '日程管理',
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
