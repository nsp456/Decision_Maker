import 'AttributeScreen.dart';
import 'package:flutter/material.dart';

import '../Appbar.dart';
import 'jobs.dart';

class MultipleAttributes extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _jobName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("With Attributes"),
          flexibleSpace: App_bar(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: Text(
                  "Enter the Name of the Decision Making Job:",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter the Name of Job',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Name Should not be empty";
                          }
                        },
                        onSaved: (String value) {
                          _jobName = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      child: Text(
                        "GO",
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        } else {
                          _formKey.currentState.save();
                          Job currentJob = Job(name: _jobName);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) =>
                                  AttributeScreen(currentJob: currentJob),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // body: Page(),
      ),
    );
  }
}
