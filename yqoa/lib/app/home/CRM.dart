import 'package:flutter/material.dart';
import 'package:yqoa/app/home/model/company_entity.dart';
import 'package:yqoa/app/net/ApiInterface.dart';
import 'package:yqoa/app/widget/appbar/MenuAppbar.dart';
import 'cell/CompanyCell.dart';
import 'package:yqoa/app/net/ErrorHandler.dart';

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
  List<CompanyData> companyData =  List<CompanyData>();
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MenuAppbar(
        title: 'CRM',
        rightIcons: ['images/nav/bell.png'],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: companyData.length,
            itemBuilder: (BuildContext context, int index) {
              return CompanyCell( data:companyData[index]);
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
    _getCompanyData();
  }
  _getCompanyData(){
    ApiInterface.getCompanyData(LoginInvalidHandler(context)).then((res){
      if(res["errcode"] == 0){
        CompanyEntity company = CompanyEntity().fromJson(res);
        setState(() {
          companyData = company.data;
        });
      }
    }).catchError((err){});
  }
}
