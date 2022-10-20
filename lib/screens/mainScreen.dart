import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/add page.dart';
import '../components/edit page.dart';
import '../components/read page .dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffe46b10),
            bottom: TabBar(tabs: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: FaIcon(Icons.remove_red_eye)),
            ]),
          ),
          body: TabBarView(children: [
            AddPage(),
            ReadPage(),
          ])),
    );
  }
}
