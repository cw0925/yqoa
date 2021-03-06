import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yqoa/app/net/ApiInterface.dart';
import 'package:yqoa/app/untils/SpUtil.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {

  String date = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(
          children: <Widget>[
            renderHeader(),
            renderBody()
          ],
        ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('名字：'+SpUtil.getString('name'));
  }
}
  Widget renderHeader(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.statusBarHeight, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                getDate(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              Text(
                SpUtil.getString('name'),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.wb_sunny,
                size: 20,
                color: Color(0xFF999999),
              ),
              Icon(
                Icons.keyboard_voice,
                size: 20,
                color: Color(0xFF999999),
              ),
            ],
          ),
        ],
      ),
    );
  }
  String getDate(){
    int month = new DateTime.now().month;
    int day = new DateTime.now().day;
    String date =  month.toString()+ '月'+ day.toString() +'日';
    return date;
  }

  Widget renderBody() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 6,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return renderCell(context,index);
      },
    );
  }
  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path);
  }
  Widget renderCell(context,index){
    var titles = ['CRM','业务管理','财务管理','人事管理','行政管理','售后服务'];
    var images = [
      getTabImage('images/home/crm.png'),
      getTabImage('images/home/business.png'),
      getTabImage('images/home/finance.png'),
      getTabImage('images/home/person.png'),
      getTabImage('images/home/admin.png'),
      getTabImage('images/home/service.png'),
    ];
    return  GestureDetector(
      onTap: (){
        pushPage(context,index);
        },
      child: Column(
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                fit: StackFit.passthrough,
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  images[index],
                  Positioned(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          titles[index],
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            color: Colors.white,
                          ),
                        )
                    ),
                  ),
                ].where((item) => item != null).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void pushPage(context,index){
    if(index == 0){
      Navigator.pushNamed(context,"/crm");
    }else if(index == 1){
      Navigator.pushNamed(context,"/test");
    }else if(index == 2){
      Navigator.pushNamed(context,"/finance");
    }else if(index == 3){
      Navigator.pushNamed(context,"/person");
    }else if(index == 4){
      Navigator.pushNamed(context,"/admin");
    }else if(index == 5){
      Navigator.pushNamed(context,"/service");
    }
  }