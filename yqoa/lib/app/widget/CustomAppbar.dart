import 'package:flutter/material.dart';

/// 这是一个可以指定SafeArea区域背景色的AppBar
/// PreferredSizeWidget提供指定高度的方法
/// 如果没有约束其高度，则会使用PreferredSizeWidget指定的高度

// ignore: must_be_immutable
class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {

  final double contentHeight; //从外部指定高度
  Color navigationBarBackgroundColor; //设置导航栏背景的颜色
  String title;
  bool hasLeft;
  List rightIcons;


  CustomAppbar({
    @required this.title,
    this.contentHeight = 44,
    this.navigationBarBackgroundColor = Colors.white,
    this.hasLeft = true,
    this.rightIcons
  }) : super();

  @override
  State<StatefulWidget> createState() {
    return new _CustomAppbarState();
  }

  @override
  Size get preferredSize => new Size.fromHeight(contentHeight);
}

/// 这里没有直接用SafeArea，而是用Container包装了一层
/// 因为直接用SafeArea，会把顶部的statusBar区域留出空白
/// 外层Container会填充SafeArea，指定外层Container背景色也会覆盖原来SafeArea的颜色
///     var statusheight = MediaQuery.of(context).padding.top;  获取状态栏高度

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: widget.navigationBarBackgroundColor,
      child: new SafeArea(
        top: true,
        child: new Container(
            decoration: new UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.0, color: Color(0xFFeeeeee)),
            ),
            height: widget.contentHeight,
            child: new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: new Container(
                    padding: const EdgeInsets.only(left: 0),
                    child:leadingWidget(widget.hasLeft),
                  ),
                ),
                new Container(
                  child: new Text(widget.title,
                      style: new TextStyle(
                          fontSize: 17, color: Color(0xFF333333))),
                ),
                Positioned(
                  right: 0,
                  child: new Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: trailingWidget(widget.rightIcons),
                  ),
                ),
              ],
            )),
      ),
    );
  }
  /// 左边图标，视情况而定，自己穿参数
  Widget leadingWidget(hasLeft){
    return hasLeft?IconButton(
      iconSize: 16,
      icon: ImageIcon(AssetImage("images/nav/back.png")),
      onPressed: () {
        Navigator.pop(context);
      },
    ):null;
  }
  /// 右边图标，视情况而定，自己穿参数
  Widget trailingWidget(icons){
    return icons==null?null:new Column(
      mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget>[
          buildGrid(icons)
        ],
    );
  }
  Widget buildGrid(icons) {
    List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(var item in icons) {
      tiles.add(
          new Row(
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(0.0),
                  iconSize: 16,
                  icon: ImageIcon(AssetImage(item.toString())),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ]
          )
      );
    }
    content = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
      //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }
}