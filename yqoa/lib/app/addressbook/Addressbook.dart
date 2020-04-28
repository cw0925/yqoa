import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/appbar/MainAppbar.dart';
import 'package:yqoa/app/net/ApiInterface.dart';
import 'package:yqoa/app/net/ErrorHandler.dart';

const APPBAR_SCROLL_OFFSET = 100; //设置滑动变化的偏移量

class AddressBook extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AddressBookPage();
  }
}

class AddressBookPage extends StatefulWidget {

  @override
  _AddressBookPageState createState() => _AddressBookPageState();
}

class _AddressBookPageState extends State<AddressBookPage> {

  var _contactsData = {};
  double appBarAlpha = 0;
  int counter;
  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getContactsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: '通讯录',
      ),
      body: Container(
        height: 800,
        color: Colors.white,
        child: ListView(
          children: _buildList(),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  List<Widget> _buildList() {
    List<Widget> widgets = [];
    List<String> names = List<String>();
    _contactsData.keys.forEach((key) {
      Map item = _contactsData[key];
      item.keys.forEach((info){
        names.add(item[info]["name"]);
      });
      widgets.add(_item(key, names));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
        children: subCities.map((subCity) => _buildSub(subCity)).toList(),
        title: Text(
          city,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
        ));
  }

  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 5,left: 12),
        //decoration: BoxDecoration(color: Colors.grey),
        child: Text(
          subCity,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  _getContactsData(){
    ApiInterface.getContactsData(LoginInvalidHandler(context)).then((res){
      print('<Contacts>--------$res');
      setState(() {
        _contactsData = res["data"];
      });
    }).catchError((err){});
  }
}
