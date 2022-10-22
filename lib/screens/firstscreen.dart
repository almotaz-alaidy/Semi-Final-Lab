import 'package:citycafe_app/screens/signup_Screen.dart';
import 'package:citycafe_app/screens/userPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/google.dart';
import 'mainScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
                  AuthServices().signOut();
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
                    "welcome to oure application",
                    style: TextStyle(fontSize: 25, fontFamily: "Combo-Regular"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    FirebaseAuth.instance.currentUser!.displayName!,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  FirebaseAuth.instance.currentUser!.email!,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffe46b10)),
                    onPressed: () {
                      if (FirebaseAuth.instance.currentUser!.email.toString() ==
                          "osamaaloun@gmail.com") {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return MainScreen();
                          },
                        ));
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return user();
                          },
                        ));
                        ;
                      }
                    },
                    child: Text("to continue please press "))
              ]),
        ));
  }
}
