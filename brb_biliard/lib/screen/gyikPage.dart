import 'package:brb_biliard/screen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:brb_biliard/screen/drawer.dart';

class gyikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Gyakran ismételt kérdések"),
          backgroundColor: const Color(0xffCE5D34),
        ),
        drawer: NavDrawer(),
        body: Column(children: [
          SizedBox(
            height: 45,
          ),
          ListTile(
            title: Text('Milyen bankkártyával fizethetek?'),
            subtitle: Text(
                'A vásárlásod a SimplePay fizető felületén keresztül zajlik. Az online vásárlások során elfogadunk minden olyan American Express, Maestro, MasterCard, Visa és Visa Electron típusú kártyát, melyek internetes fizetésre a kártyakibocsátó bank által engedélyeztetve lettek.'),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 45,
          ),
          ListTile(
            title: Text(
                'Mi történik, ha a fizetési tranzakció során hiba lépett fel?'),
            subtitle: Text(
                'Az online vásárlás során csak azok a tranzakciók teljesülnek, amelyek során a fizetési folyamat minden lépése sikeresen lezajlott és amelynek a végén a SimplePay fizető felületéről visszajutottál a Sugár Mozi oldalára és ott megkaptad a visszaigazolást a tranzakcióról. Amennyiben a folyamatban hiba lépett fel, kérjük indítsd újra a böngésződet és kezdd újra a vásárlás folyamatát.'),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 45,
          ),
          ListTile(
            title: Text(
                'Mi történik, ha véletlenül töröltem a visszaigazoló e-mailt?'),
            subtitle: Text(
                'A vásárlás során használt e-mail címedre lesz szükségünk. Ha nem kapsz időben választ, pénztárainknál e-mail címed bemondásával átveheted a jegyeket. '),
          ),
          SizedBox(
            height: 30,
          ),
        ]));
  }
}
