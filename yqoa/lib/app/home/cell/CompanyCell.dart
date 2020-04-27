import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyCell extends StatefulWidget {

  final double contentHeight; //从外部指定高度
  Color navigationBarBackgroundColor; //设置导航栏背景的颜色
  String title;
  bool hasLeft;
  List rightIcons;


  CompanyCell({
    @required this.title,
    this.contentHeight = 44,
    this.navigationBarBackgroundColor = Colors.white,
    this.hasLeft = true,
    this.rightIcons
  }) : super();

  @override
  State<StatefulWidget> createState() {
    return new _CompanyCellState();
  }
}
class _CompanyCellState extends State<CompanyCell> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Text('cell'),
    );
  }
}