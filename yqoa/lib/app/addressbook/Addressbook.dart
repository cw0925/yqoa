import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/MainAppbar.dart';

class AddressBook extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AddressBookPage(title: 'Flutter Demo Home Page');
  }
}

class AddressBookPage extends StatefulWidget {
  AddressBookPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddressBookPageState createState() => _AddressBookPageState();
}

class _AddressBookPageState extends State<AddressBookPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: '通讯录',
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
