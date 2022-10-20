import 'package:citycafe_app/components/read%20page%20.dart';
import 'package:flutter/material.dart';

class user extends StatelessWidget {
  const user({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read"),
        
      ),body: Container(child: ReadPage()),
    );
  }
}
