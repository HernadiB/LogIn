// import 'package:flutter/material.dart';
// import 'package:brb_biliard/flutter_icons.dart';
// import 'package:brb_biliard/config/palette.dart';
// import 'package:flutter_icons/flutter_icons.dart';

// class LoginSignupScreen extends StatefulWidget {
//   const LoginSignupScreen({Key? key}) : super(key: key);

//   @override
//   _LoginSignupScreenState createState() => _LoginSignupScreenState();
// }

// class _LoginSignupScreenState extends State<LoginSignupScreen> {
//   bool isSignupScreen = true;
//   bool isMale = true;
//   bool isRememberMe = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Palette.backgroundColor,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             right: 0,
//             left: 0,
//             child: Container(
//               height: 300,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("images/pool.jpg"), fit: BoxFit.fill)),
//               child: Container(
//                 padding: const EdgeInsets.only(top: 90, left: 20),
//                 color: const Color(0xFF3b5999).withOpacity(.85),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         text: "Üdvözöljük",
//                         style: TextStyle(
//                           fontSize: 25,
//                           letterSpacing: 2,
//                           color: Colors.yellow[700],
//                         ),
//                         children: [
//                           TextSpan(
//                             text: "BRB biliárd oldalán",
//                             style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.yellow[700],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     const Text(
//                       "Regisztráció",
//                       style: TextStyle(
//                         letterSpacing: 2,
//                         color: Colors.white,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 200,
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               height: 380,
//               width: MediaQuery.of(context).size.width - 40,
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         blurRadius: 15,
//                         spreadRadius: 5),
//                   ]),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: [
//                           const Text(
//                             "Regisztráció",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Palette.textColor1),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(top: 3),
//                             height: 2,
//                             width: 55,
//                             color: Colors.orange,
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           const Text(
//                             "Bejelentkezés",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Palette.activeColor),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(top: 3),
//                             height: 2,
//                             width: 55,
//                             color: Colors.orange,
//                           )
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

