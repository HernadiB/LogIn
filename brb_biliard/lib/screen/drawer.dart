import 'package:brb_biliard/page/bookPage.dart';
import 'package:brb_biliard/page/contactPage.dart';
import 'package:brb_biliard/page/homePage.dart';
import 'package:brb_biliard/page/gyikPage.dart';
import 'package:brb_biliard/screen/loginScreen.dart';
import 'package:brb_biliard/page/profilePage.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xffCE5D34),
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Felhasználónév",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Kezdőlap"),
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => FooldalPage()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Időpont foglalás"),
            leading: IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => bookPage()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Profil"),
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => profilePage()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Kapcsolat"),
            leading: IconButton(
              icon: Icon(Icons.contact_page),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => contactPage()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("GYIK"),
            leading: IconButton(
              icon: Icon(Icons.question_answer),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => gyikPage()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Kijelentkezés"),
            leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen()));
            },
          )
        ],
      ),
    );
  }
}
