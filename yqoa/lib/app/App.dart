import 'package:flutter/material.dart';

import 'package:yqoa/app/home/Home.dart';
import 'package:yqoa/app/my/My.dart';
import 'package:yqoa/app/oa/OA.dart';
import 'package:yqoa/app/schedule/Schedule.dart';
import 'package:yqoa/app/addressbook/Addressbook.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //默认 width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);

//假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, width: 750, height: 1334);

//设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    return new MainPageWidget();
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 2;
  var tabImages;
  var appBarTitles = ['待办','日程','优琪', '通讯录', '我的'];
  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }
  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      if(curIndex == 2){
        return new Text('');
      }
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }
  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }


  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [getTabImage('images/tabbar/oa.png'), getTabImage('images/tabbar/oa_s.png')],
      [getTabImage('images/tabbar/schedule.png'), getTabImage('images/tabbar/schedule_s.png')],
      [getTabImage('images/tabbar/home.png'), getTabImage('images/tabbar/home_s.png')],
      [getTabImage('images/tabbar/contacts.png'), getTabImage('images/tabbar/contacts_s.png')],
      [getTabImage('images/tabbar/my.png'), getTabImage('images/tabbar/my_s.png')]
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new OA(),
      new Schedule(),
      new Home(),
      new AddressBook(),
      new My(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据
    initData();
    return Scaffold(
        body: _pageList[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
            new BottomNavigationBarItem(
                icon: getTabIcon(4), title: getTabTitle(4)),
          ],
          type: BottomNavigationBarType.fixed,
          //默认选中首页
          currentIndex: _tabIndex,
          iconSize: 24.0,
          //点击事件
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }
}

