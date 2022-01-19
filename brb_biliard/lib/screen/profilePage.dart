import 'package:brb_biliard/screen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:brb_biliard/screen/drawer.dart';

class profilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
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
        drawer: NavDrawer(),
        body: Center(child: Text("Ez itt a user profil oldal")));
  }
}
