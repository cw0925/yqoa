import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/CustomAppbar.dart';

class CRM extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  CRMPage(title: 'Flutter Demo Home Page');
  }
}

class CRMPage extends StatefulWidget {
  CRMPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CRMPageState createState() => _CRMPageState();
}

class _CRMPageState extends State<CRMPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppbar(
        title: 'CRM',
        rightIcons: ['images/nav/bell.png','images/nav/bell.png'],
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
