import 'package:brb_biliard/screen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:brb_biliard/screen/drawer.dart';

class bookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Időpont foglalás"),
          backgroundColor: const Color(0xffCE5D34),
        ),
        drawer: NavDrawer(),
        body: Center(child: Text("Ez itt az időpont foglalás oldal")));
  }
}
