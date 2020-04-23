import 'package:flutter/material.dart';

class AddressBook extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AddressBookPage(title: 'Flutter Demo Home Page');
  }
}

class AddressBookPage extends StatefulWidget {
  AddressBookPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddressBookPageState createState() => _AddressBookPageState();
}

class _AddressBookPageState extends State<AddressBookPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OfficeAuto'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        elevation: 20.0,
        backgroundColor: Color(0xffDE331F),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.alarm),
            tooltip: "Alarm",
            onPressed: () {
              print("Alarm");
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            tooltip: "Home",
            onPressed: () {
              print("Home");
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) =>
            <PopupMenuItem<String>>[
              PopupMenuItem<String>(child: Text("热度"), value: "hot",),
              PopupMenuItem<String>(child: Text("最新"), value: "new",),
            ],
            onSelected: (String action) {
              switch (action) {
                case "hot":
                  print("hot");
                  break;
                case "new":
                  print("new");
                  break;
              }
            },
            onCanceled: () {
              print("onCanceled");
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
                'Hello'
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
