import 'package:cloud_firestore/cloud_firestore.dart';

import 'respons.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection("student");

class FirebaseCrud {
//CRUD method here

  // Read employee records____________________________________________________________________________________
  static Stream<QuerySnapshot> readInfo() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  // Update student record_______________________________________________________________________________
  static Future<Response> updateInfo({
    required String name,
    required String age,
    required String studentId,
    required String course,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "age": age,
      "studentid": studentId,
      "course": course,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated ";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  // _________________________________________________________________________________________
  // Delete Employee record____________________________________________________________________
  static Future<Response> deleteInfo({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted ";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
  // _____________________________________________________________
  //
}
