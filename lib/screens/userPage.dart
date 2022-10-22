import 'package:citycafe_app/components/read%20page%20.dart';
import 'package:citycafe_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class user extends StatelessWidget {
  const user({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Login_screen();
                  },
                ));
              },
              icon: FaIcon(Icons.login_outlined))
        ],
        backgroundColor: Color(0xffe46b10),
        title: Text("Read"),
      ),
      body: Container(child: ReadPage()),
    );
  }
}
