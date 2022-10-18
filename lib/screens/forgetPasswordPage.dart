

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailRestconroller = TextEditingController();
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailRestconroller.text.trim());
          showDialog(context: context, builder: (context) {
        return AlertDialog(content: Text("check your email"),);
      },);
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context, builder: (context) {
        return AlertDialog(content: Text(e.message.toString()),);
      },);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context, MaterialPageRoute(
                  builder: (context) {
                    return Login_screen();
                  },
                ));
              },
              icon: Icon(Icons.logout))
        ]),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Reset your password "),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: emailRestconroller,
                  decoration: InputDecoration(
                      hintText: "enter your email", border: InputBorder.none),
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: passwordReset, child: Text("reset"))
        ]));
  }
}
