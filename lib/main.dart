import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());

  //Singleton instance
  //Write
  //Firestore.instance.collection("mensagens").document().setData({"texto": "Tudo bem?", "from": "isa", "read": true});
  //Read all doc ONE TIME
  //QuerySnapshot snapshot = await Firestore.instance.collection("mensagens").getDocuments();
  //snapshot.documents.forEach((f) => print(f.data));

  /*
  //Read all from collection
  Firestore.instance.collection('mensagens').snapshots().listen((data) {
    data.documents.forEach((doc){ print(doc.data); });
  });
  */

  //Read all from document
  Firestore.instance.collection('mensagens').document('msg1').snapshots().listen((data) {
    print(data.data);
  });


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}