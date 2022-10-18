import 'package:flutter/material.dart';

class TextField1 extends StatefulWidget {
  TextField1(
      {required this.controller,
      required this.isPassword,
      required this.title});
  TextEditingController? controller;
  String? title;
  bool? isPassword;

  @override
  State<TextField1> createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.title!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
            controller: widget.controller,
            obscureText: widget.isPassword!,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true)),
      ]),
    );
  }
}
