import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yqoa/app/net/ApiInterface.dart';
import 'package:yqoa/app/untils/SpUtil.dart';
import 'package:yqoa/app/widget/toast/toast.dart';
import 'package:yqoa/app/widget/captcha/CountDownTimeModel.dart';
import 'package:yqoa/app/widget/captcha/PartialConsumeWidget.dart';


class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focusNode = new FocusNode();
  String account = '';
  String pwd = '';
  bool isPhoneLogin = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginState();
    _focusNode.addListener(_focusNodeListener);
  }
  Future<Null> _focusNodeListener() async {
    if (_focusNode.hasFocus) {
      print('获取焦点');
    } else {
      print('失去焦点');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, // 就是这里
      appBar: null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            renderHeaderView(),
            renderLoginView(),
            renderFootView()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget renderHeaderView(){
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: Image(image: AssetImage("images/login/login_logo.png"),width: 40,height: 40),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("优琪科技"),
            Text("YouQii Software")
          ],
        )
      ],
    );
  }
  Widget renderLoginView(){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(isPhoneLogin?"手机号登录":'公司账号登录'),
//          TextField(
//            autofocus: true,
//            decoration: InputDecoration(
//              labelText: isPhoneLogin?'请输入手机号':'请输入公司账号',
//              //设置输入框前面有一个电话的按钮 suffixIcon
//              prefixIcon: Icon(Icons.phone),
//              labelStyle: TextStyle(
//                fontSize: 14,
//                color: Colors.grey,
//              ),
//            ),
//            onChanged: (String content) {
//              print('content--->$content');
//              setState(() {
//                account = content;
//              });
//            },
//          ),
          TextFormField(
            autofocus: false,
            initialValue: account,
            obscureText: false,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              hintText: isPhoneLogin?'请输入手机号':"请输入公司账号",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            onChanged: (content){
              setState(() {
                account = content;
              });
            },
          ),
          Stack(
            children: <Widget>[
              TextFormField(
                autofocus: false,
                initialValue: pwd,
                obscureText: isPhoneLogin?false:true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: isPhoneLogin?'请输入验证码':"请输入密码",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                onChanged: (content){
                  setState(() {
                    pwd = content;
                  });
                },
              ),

              isPhoneLogin?PartialConsumeComponent<CountDownTimeModel>(
                model: CountDownTimeModel(60, 1),
                builder: (context, model, _) => Positioned(
                  right: 10,
                  bottom: 1,
                  top: 1,
                  child: FlatButton(
                      disabledColor: Colors.grey.withOpacity(0.36),
                      color: Colors.white70.withOpacity(0.7),
                      onPressed: !model.isFinish ? null : () {
                        model.startCountDown();
                      },
                      child: Text(
                        model.isFinish ? '获取验证码' : model.currentTime.toString()+'s',
                        style: TextStyle(color: model.isFinish ? Colors.lightBlueAccent : Colors.white),
                      )
                  ),
                ),
              ):Container(height:0.0,width:0.0),
            ],
          ),
        buildLoginButtonWidget()
        ],
    ));
  }
  Widget renderFootView(){
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Text(isPhoneLogin?"公司账号登录":"手机号登录"),
          onTap: (){
            setState(() {
              isPhoneLogin = !isPhoneLogin;
              setState(() {
                account = "";
                pwd = "";
              });
            });
          },
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("登录即代表阅读并同意"),
              Text("《用户协议》",style: TextStyle(color: Colors.blue)),
              Text("《隐私政策》",style: TextStyle(color: Colors.blue)),
            ],
          ),
        )
      ],
    );
  }
  /// 登录按钮
  Widget buildLoginButtonWidget() {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 10, right: 10),
        width: MediaQuery.of(context).size.width - 20,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
//          image: DecorationImage(
//              image: AssetImage('images/login_button.png'), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(11),
        ),
        child: FlatButton(
          onPressed: () {
            loginClick();
          },
          child: Text("登录"),
          textColor: Colors.white,
          color: Colors.transparent, // 透明色
        )

    );
  }
  loginClick(){
    ApiInterface.loginRequest(account, pwd).then((res) async {
      if(res["errcode"] == 0){
        String name = res["data"]["real_name"];
        SpUtil.putString('name', name);
        Navigator.pushNamed(context,"/app");
      }else{
        ToastUtils.showToast(res["errmsg"]);
      }
    }).catchError((err){});
  }
  checkLoginState(){
    ApiInterface.checkRequest().then((res){
      if(res["errcode"] == 0){
        Navigator.pushNamed(context,"/app");
      }
    }).catchError((err){
      print('$err');
    });

  }
}
