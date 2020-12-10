import 'package:decision_maker/Appbar.dart';
import 'package:flutter/material.dart';

import 'jobs.dart';

class AcceptAlternativeForm extends StatefulWidget {
  Job currentJob;

  AcceptAlternativeForm({@required this.currentJob});

  @override
  _AcceptAlternativeFormState createState() => _AcceptAlternativeFormState();
}

class _AcceptAlternativeFormState extends State<AcceptAlternativeForm> {
  List<dynamic> result = List();
  List<String> attrName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    attrName = widget.currentJob.attributeList.keys.toList();
    print(attrName);
    return Scaffold(
      appBar: AppBar(
        title: Text("Alternative Details"),
        flexibleSpace: App_bar(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, result);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Alternative Name",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Name cannot be empty";
                  }
                },
                onSaved: (value) {
                  result.add(value);
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.currentJob.attributeCount,
                  itemBuilder: (BuildContext contex, int index) {
                    //print(index);
                    return TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter value of ${attrName[index]}",
                      ),
                      validator: (value) {
                        double tempValue = double.tryParse(value);
                        if (tempValue == null || tempValue <= 0) {
                          return "Invalid Value";
                        }
                      },
                      onSaved: (value) {
                        result.add(value);
                      },
                    );
                  },
                ),
              ),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  Navigator.pop(context, result);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
