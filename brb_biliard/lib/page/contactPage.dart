import 'package:brb_biliard/page/homePage.dart';
import 'package:brb_biliard/widget/inputTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:brb_biliard/screen/drawer.dart';

class contactPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: AppBar(
        title: Text("Kapcsolat"),
        backgroundColor: const Color(0xffCE5D34),
      ),
      drawer: NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: screenWidth,
          height: screenHeight,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Vegye fel velünk a kapcsolatot',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  InputTextWidget(
                      labelText: "Felhasználónév",
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: 12.0,
                  ),
                  InputTextWidget(
                      labelText: "Tárgy:",
                      icon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Container(
                      child: Material(
                        elevation: 15.0,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(15.0),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 20.0, left: 15.0),
                          child: TextFormField(
                            obscureText: true,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.message,
                                color: Colors.black,
                                size: 32.0, /*Color(0xff224597)*/
                              ),
                              labelText: "Üzenet:",
                              labelStyle: TextStyle(
                                  color: Colors.black54, fontSize: 18.0),
                              hintText: '',
                              enabledBorder: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 55.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FooldalPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0.0,
                        minimumSize: Size(screenWidth, 150),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: const Color(0xffCE5D34),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                            color: const Color(0xffCE5D34),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Küldés",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
