import 'package:flutter/material.dart';

import 'Appbar.dart';

class FlipCoin extends StatefulWidget {
  @override
  _FlipCoinState createState() => _FlipCoinState();
}

class _FlipCoinState extends State<FlipCoin> {
  final _formKey = GlobalKey<FormState>();

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
          onPressed: () => Navigator.of(context).pop(),
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
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Head\'s value'),
                validator: (v) {
                  if (v.trim().isEmpty) return 'Please enter something';
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Tail\'s name'),
                validator: (v) {
                  if (v.trim().isEmpty) return 'Please enter something';
                  return null;
                },
              ),
              SizedBox(
                height: 80,
              ),
              FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () {},
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
}
