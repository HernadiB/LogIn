import 'package:brb_biliard/screen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:brb_biliard/screen/drawer.dart';

class FooldalPage extends StatefulWidget {
  @override
  _FooldalPage createState() => _FooldalPage();
}

class _FooldalPage extends State<FooldalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BRB biliárd főoldal"),
        backgroundColor: const Color(0xffCE5D34),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new LoginScreen(),
                ));
              })
        ],
      ),
      body: Center(child: Container()),
      drawer: NavDrawer(),
    );
  }
}