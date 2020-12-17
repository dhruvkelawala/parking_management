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
    databaseReference = FirebaseDatabase.instance.reference();

    DataSnapshot dataSnapshot = await databaseReference.once();
    // print(dataSnapshot.value);

    print(dataSnapshot.value["12121212"]);

    return dataSnapshot.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getSensorValue(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Slot 1: " + snapshot.data["slot1"],
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "Slot 2: " + snapshot.data["slot2"],
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "Slot 3: " + snapshot.data["slot3"],
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ); // Add your Custom Widget of Column, Rows here.
          }
          return Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
