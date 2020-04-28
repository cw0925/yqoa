import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/appbar/MenuAppbar.dart';

class Finance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  FinancePage();
  }
}

class FinancePage extends StatefulWidget {
  FinancePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {

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
