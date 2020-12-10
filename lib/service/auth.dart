//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

class AuthService {
  final _firestore = FirebaseFirestore.instance;
  dynamic data;

  addData() async {
    _firestore.collection('user').add({"name": "Siddharth"});
  }

  fetchdata(String id) async {
    CollectionReference collectionReference = _firestore.collection('user');
    collectionReference.snapshots().listen((snapshot) {
      for (int i = 0; i < snapshot.docs.length; i++) {
        if (snapshot.docs[i].id == id) {
          this.data = snapshot.docs[i].data();
          print(data.toString() + '-----------------------------------');
        }
      }
    });
  }
  // sign in anon

}
