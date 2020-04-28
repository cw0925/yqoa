import 'package:flutter/material.dart';
import 'package:yqoa/app/net/ApiInterface.dart';
import 'package:yqoa/app/widget/MenuAppbar.dart';
import 'cell/CompanyCell.dart';
import 'package:yqoa/app/net/ErrorHandler.dart';
import 'package:yqoa/app/home/model/company_entity.dart';

class CRM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CRMPage();
  }
}

class CRMPage extends StatefulWidget {

  CRMPage({Key key}) : super(key: key);

  @override
  _CRMPageState createState() => _CRMPageState();
}

class _CRMPageState extends State<CRMPage> {

  List<CompanyData> companyData = <CompanyData>[];

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
              return getItem(companyData[index]);
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
  Widget getItem(CompanyData item) {
    return CompanyCell(data: item,);
  }
  //  获取公司列表数据
  Future<List<CompanyEntity>> _getCompanyData() {
    // ignore: missing_return
    ApiInterface.getCompanyData(LoginInvalidHandler(context)).then((res){
      if(res["errcode"] == 0){
        CompanyEntity model = CompanyEntity().fromJson(res);
        setState(() {
          companyData = model.data;
        });
      }
    }).catchError((err){});
  }
}
