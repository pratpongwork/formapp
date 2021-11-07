// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:formapp/model/model.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Formapp extends StatefulWidget {
  const Formapp({Key? key}) : super(key: key);

  @override
  _FormappState createState() => _FormappState();
}

class _FormappState extends State<Formapp> {
  final formKey = GlobalKey<FormState>();
  Students mystudent = Students();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _studentsCollection =
      new FirebaseFirestore.instance.collection("students");

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Name",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  validator: RequiredValidator(errorText: "No info"),
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
                  validator: MultiValidator([
                    RequiredValidator(errorText: "No info"),
                    EmailValidator(errorText: "Pls use email")
                  ]),
                  onSaved: (String? email) {
                    mystudent.email = email;
                  },
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      formKey.currentState!.save();
                      print("${mystudent.fname}");
                      print("${mystudent.lname}");
                      print("${mystudent.email}");
                    },
                    child: Text('SAVE'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
