import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

import 'Appbar.dart';
import 'fcr.dart';
import 'home.dart';

class FlipCoin extends StatefulWidget {
  @override
  _FlipCoinState createState() => _FlipCoinState();
}

class _FlipCoinState extends State<FlipCoin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static final List<String> coinList = [null, null];
  int ch;
  String coinChoice;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(auth.currentUser.email)));
          },
        ),
        title: Text("Flip A Coin"),
        flexibleSpace: App_bar(),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              addTextField('Head', 0),
              SizedBox(height: 40),
              addTextField('Tail', 1),
              SizedBox(height: 80),
              FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    coinChoice = coinToss();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FlipCoinResult(ch, coinChoice)));
                  }
                },
                child: Center(
                  child: Text(
                    'Flip Coin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                color: Colors.lightGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String coinToss() {
    int length = coinList.length;
    Random random = Random();
    int ch = random.nextInt(length);
    return coinList[ch];
  }

  Widget addTextField(String value, int ind) {
    return TextFormField(
      controller: _nameController,
      onChanged: (v) => coinList[ind] = v,
      decoration: InputDecoration(hintText: 'Enter $value\'s value'),
      validator: (v) {
        if (v.trim().isEmpty) return 'Text field cannot be blank';
        return null;
      },
    );
  }
}
