import 'package:flutter/material.dart';
import 'package:yqoa/app/widget/MenuAppbar.dart';
import 'cell/CompanyCell.dart';

class CRM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CRMPage();
  }
}

class CRMPage extends StatefulWidget {
  CRMPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CRMPageState createState() => _CRMPageState();
}

class _CRMPageState extends State<CRMPage> {
  List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MenuAppbar(
        title: 'CRM',
        rightIcons: ['images/nav/bell.png'],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int index) {
              return getItem(index);
            }),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgets = List<Widget>();
    for (int i = 0; i < 80; i++) {
      widgets.add(getItem(i));
    }
//    SharedPreferencesUtil spDataUtil = new SharedPreferencesUtil();
//
//    var name = spDataUtil.getStringInfo("name").toString();
//    var sex = spDataUtil.getStringInfo("sex");
//
//    print(name);
//    print(sex);
  }
//  Widget getItem(int index) {
//    return GestureDetector(
//      onTap: () {
//        print("item click ******************* $index");
//      },
//      child: Padding(
//        padding: EdgeInsets.all(10.0),
//        child: Text("text $index"),
//      ),
//    );
//  }
  Widget getItem(int index) {
    return CompanyCell(title: 'aaaa',);
  }
}
