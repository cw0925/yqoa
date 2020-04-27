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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.data.name),
          Text(widget.data.tel)
        ],
    );
  }
}