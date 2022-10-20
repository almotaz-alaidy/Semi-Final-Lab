import 'package:flutter/material.dart';

import 'firbase classes.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //  implement createState ______________________
    return _AddPage();
  }
}

class _AddPage extends State<AddPage> {
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _studentid = TextEditingController();
  final _course = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
        controller: _name,
        autofocus: false,
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
            hintText: "age",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final studentIdField = TextFormField(
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
            hintText: "course ",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.addInfo(
                name: _name.text,
                age: _age.text,
                course: _age.text,
                studentId: _studentid.text);

            if (response.code != 200) {
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
          }
        },
        child: Text(
          "Save",
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
                    nameField,
                    const SizedBox(height: 25.0),
                    ageField,
                    const SizedBox(height: 35.0),
                    studentIdField,
                    const SizedBox(height: 35.0),
                    courseField,
                    const SizedBox(height: 35.0),
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
