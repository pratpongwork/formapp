// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:formapp/model/model.dart';

class Formapp extends StatefulWidget {
  const Formapp({Key? key}) : super(key: key);

  @override
  _FormappState createState() => _FormappState();
}

class _FormappState extends State<Formapp> {
  final formKey = GlobalKey<FormState>();
  Students mystudent = Students();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SAVE"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "Name",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? fname) {
                    mystudent.fname = fname;
                  },
                ),
                SizedBox(height: 15),
                Text(
                  "Surname",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? lname) {
                    mystudent.lname = lname;
                  },
                ),
                SizedBox(height: 15),
                Text(
                  "E-mail",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? email) {
                    mystudent.email = email;
                  },
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      print("${mystudent.fname}");
                      print("${mystudent.lname}");
                      print("${mystudent.email}");
                    },
                    child: Text('SAVE'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
