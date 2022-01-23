import 'package:brb_biliard/screen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:brb_biliard/screen/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      // body: Row(
      //   children: <Widget> [
      //   Container(
      //     child: Text(
      //       "Üdvözöljük a BRB biliárd klubban",
            
      //     ),
      //   ),
      //   Container(),
      //   Container(),
      //   ],
      // ),
      body:Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30)),
          Container(
            height: 50,
            child: Text(
              "Üdvözöljük a BRB biliárd klubban",
              style: TextStyle(
                fontSize: 32,
                fontStyle: FontStyle.italic,
                color: Color(0xffCE5D34),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Container(
            child:
                  DataTable(
              columns: [
                DataColumn(label: Text("Felhasználónév")),
                DataColumn(label: Text("Foglalás kezd. ideje")),
                DataColumn(label: Text("Foglalás bef. ideje")),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("felh1")),
                  DataCell(Text("2022-01-26 14:00")),
                  DataCell(Text("2022-01-26 16:00")),
                ])
              ]
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Container(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                textStyle: TextStyle(fontSize: 14),
                primary: Color(0xffCE5D34),
                side: BorderSide(width: 3, color: Color(0xffCE5D34)),
              ),
              child: Text("Foglalás törlése"),
              onPressed: () => Fluttertoast.showToast(
                msg:"Foglalás törölve"),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Container(
            child: Image(
              image: AssetImage('images/asset/asztal.jpg'),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text("Elérhetőségek"),
                subtitle: Text("Nyitvatartás: H-V 08:00-16:00\nCímünk: 1144 Budapest, Kerepesi út 124.\nTelefon: +36-20-123-4567\nE-mail: nyari.hernadi@biliboc.hu"),
              ),
            ],
          ),
        ],
      ),
      

      drawer: NavDrawer(),
    );
  }
}
