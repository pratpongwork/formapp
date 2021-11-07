import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show"),
      ),
      body: StreamBuilder(
          stream: _studentCollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
                children: snapshot.data!.docs.map((document) {
              return Container(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(
                      child: Text("Hello"),
                    ),
                  ),
                  title: Text(document["fname"] + ' ' + document["lname"]),
                  subtitle: Text(document["email"]),
                ),
              );
            }).toList());
          }),
    );
  }
}
