import 'package:flutter/material.dart';
import 'dart:math';

import 'home.dart';
import 'Appbar.dart';
import 'rr.dart';
import 'anim.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static List<String> alternativesList = [null];
  String choice;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.lightGreen,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                alternativesList.insert(0, null);
                _getAlternatives();
                setState(() {});
              },
            ),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyHomePage()))),
        title: Text("Random Answer Generator"),
        flexibleSpace: App_bar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new SingleChildScrollView(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Alternatives',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  ..._getAlternatives(), // spread operator (...) provides a concise way to insert multiple elements into a collection.
                  SizedBox(
                    height: 40,
                  ),
                  FlatButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        choice = randomAnswerGenerator();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnimationPage(choice)));
                      }
                    },
                    child: Center(
                      child: Text(
                        'Generate Random Answer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    color: Colors.lightGreen,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getAlternatives() {
    List<Widget> alternativesTextFields = [];
    for (int i = 0; i < alternativesList.length; i++) {
      alternativesTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: AlternativeTextFields(i)),
            SizedBox(
              width: 16,
            ),
            _removeButton(i),
          ],
        ),
      ));
    }
    return alternativesTextFields;
  }

  Widget _removeButton(int index) {
    return InkWell(
      onTap: () {
        alternativesList.removeAt(index);
        setState(() {});
      },
      child: Container(
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
    );
  }

  String randomAnswerGenerator() {
    int length = alternativesList.length;
    Random random = Random();
    return alternativesList[random.nextInt(length)];
  }
}

class AlternativeTextFields extends StatefulWidget {
  final int index;
  AlternativeTextFields(this.index);
  @override
  _AlternativeTextFieldsState createState() => _AlternativeTextFieldsState();
}

class _AlternativeTextFieldsState extends State<AlternativeTextFields> {
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _nameController.text =
            _MyFormState.alternativesList[widget.index] ?? '';
      },
    );

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _MyFormState.alternativesList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Enter Alternative\'s name'),
      validator: (v) {
        if (v.trim().isEmpty) return 'Text field cannot be blank';
        return null;
      },
    );
  }
}
