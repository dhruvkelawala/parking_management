import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseReference databaseReference;

  Future getSensorValue() async {
    databaseReference =
        FirebaseDatabase.instance.reference().child("automation-product");

    DataSnapshot dataSnapshot = await databaseReference.once();
    print(dataSnapshot.value);

    print(dataSnapshot.value["12121212"]);

    return dataSnapshot.value['slot2'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSensorValue(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return Container(
            child: Column(),
          ); // Add your Custom Widget of Column, Rows here.
        }
        return CircularProgressIndicator();
      },
    );
  }
}
