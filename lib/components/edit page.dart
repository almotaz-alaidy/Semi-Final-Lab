import 'package:flutter/material.dart';

import '../screens/mainScreen.dart';
import 'clss.dart';
import 'firbase classes.dart';

class EditPage extends StatefulWidget {
  final Tabels? info;
  EditPage({this.info});

  @override
  State<StatefulWidget> createState() {
    //  implement createState _________________________________________________________
    return _EditPage();
  }
}

class _EditPage extends State<EditPage> {
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _course = TextEditingController();
  final _studentid = TextEditingController();
  final _docid = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _name.value = TextEditingValue(text: widget.info!.name.toString());
    _age.value = TextEditingValue(text: widget.info!.age.toString());
    _course.value = TextEditingValue(text: widget.info!.course.toString());
    _studentid.value =
        TextEditingValue(text: widget.info!.studentId.toString());
    _docid.value = TextEditingValue(text: widget.info!.docId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final DocIDField = TextField(
        controller: _docid,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final nameField = TextFormField(
        controller: _name,
        autofocus: true,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final ageField = TextFormField(
        controller: _age,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "age ",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final courseField = TextFormField(
      controller: _course,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "course",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final studentidField = TextFormField(
      controller: _studentid,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "student id",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => MainScreen(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('back to main screen'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.updateInfo(
              docId: _docid.text,
              name: _name.text,
              age: _age.text,
              course: _course.text,
              studentId: _studentid.text,
            );

            if (response.code == 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          } else {
            // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
          }
        },
        child: Text(
          "Update",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // DocIDField,
                    const SizedBox(height: 25.0),
                    nameField,
                    const SizedBox(height: 25.0),
                    ageField,
                    const SizedBox(height: 35.0),
                    courseField,
                    const SizedBox(height: 35.0),
                    studentidField,
                    const SizedBox(height: 35.0),

                    viewListbutton,
                    const SizedBox(height: 45.0),
                    SaveButon,
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
