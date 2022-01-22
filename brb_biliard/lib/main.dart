import 'package:flutter/material.dart';
import 'package:brb_biliard/screen/loginScreen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:brb_biliard/screen/eventprovider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BRB biliárd',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
