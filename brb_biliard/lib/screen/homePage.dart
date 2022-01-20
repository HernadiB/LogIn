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
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Text(
          "Elérhetőségek",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
        ),
        Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                TableRow(children: [
                  Column(children: [Text('Nyitvatartás:')]),
                  Column(children: [Text('H-P 08:00-16:00')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('Címünk:')]),
                  Column(children: [Text('1144 Budapest, Kerepesi út 124.')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('Telefon:')]),
                  Column(children: [Text('+36-20-123-4567')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('Email:')]),
                  Column(children: [Text('nyari.hernadi@biliboc.hu')]),
                ]),
              ],
            ),
          ),
        ])),
      ]),
      drawer: NavDrawer(),
    );
  }
}
