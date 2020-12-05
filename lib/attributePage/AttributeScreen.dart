import 'AcceptAttributeForm.dart';
import 'BottomButton.dart';
import 'ImportanceScreen.dart';
import 'jobs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:decision_maker/Appbar.dart';
import 'IndividualAttributeCard.dart';

class AttributeScreen extends StatefulWidget {
  Job currentJob;

  AttributeScreen({@required this.currentJob});
  @override
  AttributeScreenState createState() => AttributeScreenState();
}

class AttributeScreenState extends State<AttributeScreen> {
  static int counter = 0;
  List<String> listOfWidgets = [];
  List<bool> vals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6f8),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AcceptAttributeForm(),
                ),
              );
              if (result.isNotEmpty) {
                setState(() {
                  listOfWidgets.add(result[0]);
                  vals.add(result[1]);
                  counter++;
                });
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (listOfWidgets.length > 0) {
                  listOfWidgets.removeAt(listOfWidgets.length - 1);
                  vals.removeAt(vals.length - 1);
                  counter--;
                }
              });
            },
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Add Attributes"),
        flexibleSpace: App_bar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listOfWidgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    //print(AttributeScreen.counter);
                    return IndividualAttributeCard(
                        nameOfAttributeToBeDisplayed: listOfWidgets[index]);
                  },
                ),
              ),
              BottomButton(
                buttonName: "NEXT STEP",
                funName: () {
                  //print(widget.currentJob.attributeList);
                  //print(widget.currentJob.attributeList.keys.length);
                  if (listOfWidgets.length > 1) {
                    widget.currentJob.attributeList = Map();
                    for (int i = 0; i < listOfWidgets.length; i++) {
                      widget.currentJob.createAttribute(
                        name: listOfWidgets[i],
                        isHigherValuePreferred: vals[i],
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ImportanceScreen(currentJob: widget.currentJob),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
