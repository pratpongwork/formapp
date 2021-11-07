import 'package:flutter/material.dart';

class Formapp extends StatefulWidget {
  const Formapp({Key? key}) : super(key: key);

  @override
  _FormappState createState() => _FormappState();
}

class _FormappState extends State<Formapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SAVE"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(),
            SizedBox(height: 15),
            Text(
              "Surname",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(),
            SizedBox(height: 15),
            Text(
              "E-mail",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('SAVE'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
