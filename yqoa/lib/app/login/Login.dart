import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: Column(
        children: <Widget>[
          Text("手机号登录")
        ],
      ),
    );
  }
  Widget renderFootView(){
    return Column(
      children: <Widget>[
        Text("公司账号登录"),
      ],
    );
  }

}
