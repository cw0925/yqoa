import 'package:flutter/material.dart';
import 'package:yqoa/app/home/model/company_entity.dart';

// ignore: must_be_immutable
class CompanyCell extends StatefulWidget {

  final CompanyData data;

  CompanyCell({
    @required this.data
  }) : super();

  @override
  State<StatefulWidget> createState() {
    return new _CompanyCellState();
  }
}
class _CompanyCellState extends State<CompanyCell> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.data.name),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(widget.data.tel),
                  )
                ],
              ),
            ),
            Divider(height: 1.0,indent: 20.0,endIndent: 20,color: Colors.grey,)
          ]
      ),
    );
  }
}