import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/appbar/MenuAppbar.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  AdminPage();
  }
}

class AdminPage extends StatefulWidget {
  AdminPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MenuAppbar(
        title: 'CRM',
        rightIcons: ['images/nav/bell.png'],
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    SharedPreferencesUtil spDataUtil = new SharedPreferencesUtil();
//
//    var name = spDataUtil.getStringInfo("name").toString();
//    var sex = spDataUtil.getStringInfo("sex");
//
//    print(name);
//    print(sex);
  }
}
