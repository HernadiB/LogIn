// import 'package:flutter/material.dart';
// import 'login_signup.dart';
// import 'package:brb_biliard/screen/login_signup.dart';

// void main() {
//   runApp(const LoginSignupUI());
// }

// class LoginSignupUI extends StatelessWidget {
//   const LoginSignupUI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Login Signup UI",
//       home: LoginSignupScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brb_biliard/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
