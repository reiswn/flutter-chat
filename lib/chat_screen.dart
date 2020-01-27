import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mychat/text_composer.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá'),
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }
}

void _sendMessage({String text, File imgFile}) async {

  Map<String, dynamic> data = {};

  if(imgFile != null){
    //StorageUploadTask uploadTask = FirebaseStorage.instance.ref().child('pasta').child('');
    StorageUploadTask uploadTask = FirebaseStorage.instance.ref().child(
      DateTime.now().millisecondsSinceEpoch.toString()
    ).putFile(imgFile);

    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String url = await taskSnapshot.ref.getDownloadURL();
    data['imageUrl'] = url;
  }

  if(text != null) data['text'] = text;

  Firestore.instance.collection('menssages').add(data);
}
