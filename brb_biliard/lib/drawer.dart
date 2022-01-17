import "package:flutter/material.dart";
import 'package:brb_biliard/idopont.dart';
import 'package:brb_biliard/fooldal.dart';

class DrawerItem {
  String title;
  DrawerItem(this.title);
}

class DrawerPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Főoldal"),
    new DrawerItem("Időpont foglalás"),
    new DrawerItem("Rólunk"),
    new DrawerItem("GYIK"),
  ];

  @override
  State<StatefulWidget> createState() {
    return new DrawerPageState();
  }
}

class DrawerPageState extends State<DrawerPage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FooldalPage();
      case 1:
      // return new IdopontPage();
      case 2:
      // return new RolunkPage();
      case 3:
      // return new GYIKPage();

      default:
      // return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Container(
        width: 200,
        child: Drawer(
          child: Container(
            color: Color.fromRGBO(247, 241, 255, 1),
            child: new ListView(
              children: <Widget>[
                //new UserAccountsDrawerHeader( accountName: new Text("Hello World Flutter!"), accountEmail: null),
                // new DrawerHeader(
                // decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("assets/images/logo.png"),
                //     fit: BoxFit.contain)), child: null,
                // ),
                new Column(children: drawerOptions),
              ],
            ),
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
