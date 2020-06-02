import 'package:flutter/material.dart';
import 'package:yqoa/app/net/NetUtil.dart';
import 'package:yqoa/app/untils/SpUtil.dart';
import 'package:yqoa/app/widget/appbar/MainAppbar.dart';

class My extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyPage(title: 'Flutter Demo Home Page');
  }
}

class MyPage extends StatefulWidget {
  MyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<String> titles = ["我的信息","问题反馈","关于我们"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: '个人中心',
        rightIcons: ["images/nav/bell.png","images/nav/setting.png"],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              color: Colors.grey,
              child: renderHeaderView(),
            ),
          ),
          // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(_buildListItem, childCount: 3),
              itemExtent: 48.0
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  // 列表项
  Widget _buildListItem(BuildContext context, int index){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Text(titles[index]),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Icon(
                  Icons.arrow_right,
                  size: 30,
                  color: Color(0xFF999999),
                ),
              )
            ],
          ),
          Divider(height: 1.0,indent: 20.0,endIndent: 20,color: Colors.grey,)
        ],
      )
    );
  }
  Widget renderHeaderView(){
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("张三"),
                  Text("ios developer"),
                ],
              ),
              Image(image: new AssetImage('images/my/default.png'),width: 40,height: 40)
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("入职日期"),
                Text("最后登录"),
              ],
            ),
          )
        ],
      )
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String uid =  SpUtil.getString('uid');
    String url = 'users/'+ uid;
    NetUtil.getJson(url, {}).then((res){
      print(res);
    });
  }
}
