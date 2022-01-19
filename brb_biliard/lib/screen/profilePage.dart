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
        ),
        drawer: NavDrawer(),
        body: Column(children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.cover,
                  image: const NetworkImage(
                      'https://images.unsplash.com/photo-1485160497022-3e09382fb310?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fG1vdW50YWluc3xlbnwwfHwwfHw%3D&w=1000&q=80'),
                ),
                Positioned(
                    bottom: -50.0,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(''),
                      ),
                    ))
              ]),
          SizedBox(
            height: 45,
          ),
          ListTile(
            title: Center(child: Text('Felhasználónév')),
            subtitle: Center(child: Text('PoolMaster')),
          ),
          ListTile(
            title: Text('Rólam:'),
            subtitle: Text(
                'Szeretek biliárdozniSzeretek biliárdozniSzeretek biliárdozniSzeretek biliárdozniSzeretek biliárdozniSzeretek biliárdozniSzeretek biliárdozniSzeretek biliárdozniSzeretek biliárdozni'),
          ),
          SizedBox(
            height: 20,
          ),
        ]));
  }
}
