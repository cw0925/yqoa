import 'package:flutter/material.dart';

class OA extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  OAPage(title: 'Flutter Demo Home Page');
  }
}

class OAPage extends StatefulWidget {
  OAPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OAPageState createState() => _OAPageState();
}

class _OAPageState extends State<OAPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
        vsync: this,    // 动画效果的异步处理
        length: 5       // tab 个数
    );
    _tabController.addListener(() {
      print(this._tabController.toString());
      print(this._tabController.index);
      print(this._tabController.length);
      print(this._tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle:false,
        backgroundColor: Colors.white,
        title: new Text('待办事项',style: TextStyle(color: Colors.black),),
        bottom: new TabBar(
          isScrollable: true,
          labelColor:Colors.blue,
          unselectedLabelColor:Colors.black,
          indicatorColor:Colors.blue,
          tabs: <Widget>[
            new Tab(
              text: '单据审批',
            ),
            new Tab(
              text: '采购审批',
            ),
            new Tab(
              text: '发票审批',
            ),
            new Tab(
              text: '项目审批',
            ),
            new Tab(
              text: '用印审批',
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(child: new Text('单据审批')),
          new Center(child: new Text('采购审批')),
          new Center(child: new Text('发票审批')),
          new Center(child: new Text('项目审批')),
          new Center(child: new Text('用印审批')),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
