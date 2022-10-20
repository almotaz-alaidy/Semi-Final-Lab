import 'package:citycafe_app/screens/signup_Screen.dart';
import 'package:citycafe_app/screens/userPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'mainScreen.dart';

class FirstScreenEmail extends StatefulWidget {
  const FirstScreenEmail({super.key});

  @override
  State<FirstScreenEmail> createState() => _FirstScreenEmailState();
}

class _FirstScreenEmailState extends State<FirstScreenEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffe46b10),
          title: Text(
            "WELCOME AT LTUC",
            style: TextStyle(
                fontSize: 25, fontFamily: "DancingScript-VariableFont_wght"),
          ),
          actions: <Widget>[
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffe46b10)),
                label: Text("logeut"),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.login_outlined))
          ],
        ),
        body: Container(
          color: Color.fromARGB(255, 230, 142, 75),
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "welcome to oure website",
                    style: TextStyle(fontSize: 25, fontFamily: "Combo-Regular"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    nameController.text,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffe46b10)),
                      onPressed: () {
                      if (FirebaseAuth.instance.currentUser!.email.toString()=="osamaaloun@gmail.com") {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return MainScreen();
                          },
                        ));
                      }else{
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return user();
                          },
                        ));
                      ;
                     } },
                    child: Text("to continue please press "))
              ]),
        ));
  }
}
