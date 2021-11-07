// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:formapp/model/model.dart';

class Formapp extends StatefulWidget {
  Formapp({Key? key}) : super(key: key);

  @override
  _FormappState createState() => _FormappState();
}

class _FormappState extends State<Formapp> {
  final formkey = GlobalKey<FormState>();
  Students mystudent = Students();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("บันทึก"),
              ),
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "ชื่อ",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณากรอกข้อมูล"),
                              onSaved: (String? fname) {
                                mystudent.fname = fname;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "นามสกุล",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณากรอกข้อมูล"),
                              onSaved: (String? lname) {
                                mystudent.lname = lname;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "อีเมล",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "กรุณากรอกข้อมูล"),
                                EmailValidator(
                                    errorText: "กรุณากรอกในรูปแบบของอีเมล")
                              ]),
                              onSaved: (String? email) {
                                mystudent.email = email;
                              }),
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {
                                formkey.currentState!.validate();
                                formkey.currentState!.save();
                                print("${mystudent.fname}");
                                print("${mystudent.lname}");
                                print("${mystudent.email}");
                              },
                              child: Text("บันทึก"),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
