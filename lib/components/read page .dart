import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference studentRef =
        FirebaseFirestore.instance.collection("student");
    return Container(
      color: Color.fromARGB(255, 230, 142, 75),
      child: FutureBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          return Container(
              child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, i) {
              return ListTile(
                trailing: Text(
                  " age : ${snapshot.data!.docs[i]['age']}",
                  style: TextStyle(fontSize: 25, fontFamily: "Combo-Regular"),
                ),
                leading: Text(
                  "name : ${snapshot.data!.docs[i]['name']}",
                  style: TextStyle(fontSize: 25, fontFamily: "Combo-Regular"),
                ),
                title: Text(
                  "course : ${snapshot.data!.docs[i]['course']}",
                  style: TextStyle(fontSize: 25, fontFamily: "Combo-Regular"),
                ),
                subtitle: Text(
                  "student id : ${snapshot.data!.docs[i]['studentid']}  ",
                  style: TextStyle(fontSize: 25, fontFamily: "Combo-Regular"),
                ),
              );
            },
          ));
        },
        future: studentRef.get(),
      ),
    );
  }
}
