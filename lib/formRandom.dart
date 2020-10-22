import 'package:flutter/material.dart';

import 'Appbar.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
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
        title: Text("Random Answer Generator"),
        flexibleSpace: App_bar(),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Your Choices',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Choice 1'),
                      validator: (v) {
                        if (v.trim().isEmpty) return 'Please enter something';
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Choice 2'),
                      validator: (v) {
                        if (v.trim().isEmpty) return 'Please enter something';
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Choice 3'),
                      validator: (v) {
                        if (v.trim().isEmpty) return 'Please enter something';
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
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
                    'Generate Random Answer',
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
