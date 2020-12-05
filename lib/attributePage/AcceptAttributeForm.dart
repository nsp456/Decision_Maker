import 'package:flutter/material.dart';

import '../Appbar.dart';

class AcceptAttributeForm extends StatefulWidget {
  @override
  _AcceptAttributeFormState createState() => _AcceptAttributeFormState();
}

class _AcceptAttributeFormState extends State<AcceptAttributeForm> {
  List<dynamic> inputValues = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Set Attribute"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, inputValues),
          ),
          flexibleSpace: App_bar(),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Attribute Name",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Name cannot be empty";
                        }
                      },
                      onSaved: (value) {
                        inputValues.insert(0, value);
                        inputValues.insert(1, isSwitched);
                      },
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Are Higher values Preferred:",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeColor: Colors.green,
                          activeTrackColor: Colors.green,
                        )
                      ],
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
                        Navigator.pop(context, inputValues);
                      },
                    )
                  ],
                ),
              )),
        ));
  }
}
