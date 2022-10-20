import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'clss.dart';
import 'edit page.dart';
import 'firbase classes.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readInfo();
  //FirebaseFirestore.instance.collection('Employee').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xffe46b10),
        title: const Text("student"),
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Color.fromARGB(255, 230, 142, 75),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView(
                  children: snapshot.data!.docs.map((e) {
                    return Card(
                        child: Column(children: [
                      Container(
                          child: Text(
                        "name: " + e['name'],
                      )),
                      Container(
                          child: Text(
                        "age: " + e['age'],
                      )),
                      Container(
                          child: Text(
                        "course: " + e['course'],
                      )),
                      Container(
                          child: Text(
                        "studentid: " + e['studentid'],
                      )),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(5.0),
                              primary: const Color.fromARGB(255, 143, 133, 226),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            child: const Text('Edit'),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil<dynamic>(
                                context,
                                MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) => EditPage(
                                    info: Tabels(
                                      docId: e.id,
                                      name: e["name"],
                                      age: e["age"],
                                      course: e["course"],
                                      studentId: e["studentid"],
                                    ),
                                  ),
                                ),
                                (route) =>
                                    false, //if you want to disable back feature set to false
                              );
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(5.0),
                              primary: const Color.fromARGB(255, 143, 133, 226),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            child: const Text('Delete'),
                            onPressed: () async {
                              var response =
                                  await FirebaseCrud.deleteInfo(docId: e.id);
                              if (response.code != 200) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content:
                                            Text(response.message.toString()),
                                      );
                                    });
                              }
                            },
                          ),
                        ],
                      ),
                    ]));
                  }).toList(),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
