import 'package:flutter/material.dart';

import 'BottomButton.dart';
import 'jobs.dart';
import 'package:decision_maker/Appbar.dart';
import 'AcceptAlternativeForm.dart';
import 'TimelineScreen.dart';

class AlternativeScreen extends StatefulWidget {
  Job currentJob;
  AlternativeScreen({@required this.currentJob});

  @override
  _AlternativeScreenState createState() => _AlternativeScreenState();
}

class _AlternativeScreenState extends State<AlternativeScreen> {
  List<String> listOfWidgets = [];
  //final Function eq = const ListEquality().equals;
  List<List<dynamic>> values = [];
  Map<String, List<dynamic>> tempValues = Map();
  static int counter = 0;
  List<Widget> widgetList;
  List<List<Widget>> ultimateList = [];
  //List<String> listOfWidgetsPrev = List();

  @override
  Widget build(BuildContext context) {
    List<String> attrName = widget.currentJob.attributeList.keys.toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AcceptAlternativeForm(currentJob: widget.currentJob),
                ),
              );
              if (result.isNotEmpty) {
                setState(() {
                  listOfWidgets.add(result[0]);
                  tempValues[result[0]] = List();
                  widgetList = List();
                  List<double> tempList = List();
                  for (int i = 1; i < result.length; i++) {
                    //print("i: $i");
                    //print("listOfWidget: ${listOfWidgets[i - 1]}");
                    tempValues[result[0]].add(result[i]);
                    tempList.add(double.tryParse(result[i]));
                    widgetList.add(
                      ListTile(
                        title: Text(
                          "${attrName[i - 1]}: ${result[i]}",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    );
                  }
                  //print("tempvalues: $tempValues");
                  ultimateList.add(widgetList);
                  values.add(tempList);
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
                  String temp = listOfWidgets[listOfWidgets.length - 1];
                  listOfWidgets.removeAt(listOfWidgets.length - 1);
                  ultimateList.removeAt(ultimateList.length - 1);
                  values.removeAt(values.length - 1);
                  dynamic r = tempValues.remove(temp);
                  //print("tempValues after delte: $tempValues");
                  counter--;
                }
              });
            },
          )
        ],
        title: Text("Add Alternatives"),
        flexibleSpace: App_bar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listOfWidgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: ExpansionTile(
                          backgroundColor: Colors.white,
                          title: Text(
                            listOfWidgets[index],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: ultimateList[index],
                        ));
                  },
                ),
              ),
              BottomButton(
                  buttonName: "CALCULATE RESULT",
                  funName: () {
                    if (listOfWidgets.length > 0) {
                      widget.currentJob.alternatives = List();
                      widget.currentJob.rankingList = List();
                      widget.currentJob.weightOfAttribute = List();
                      widget.currentJob.indValueOfAlternative = List();
                      for (int i = 0; i < listOfWidgets.length; i++) {
                        //print("Values[i] ${values[i]}");
                        widget.currentJob.createAlternative(
                            name: listOfWidgets[i], values: values[i]);
                      }
                      widget.currentJob.calculateWeights();
                      widget.currentJob.calculateAlternativeImportance();
                      widget.currentJob.calculateRanking();
                      /* for (String l in listOfWidgets) {
                    listOfWidgetsPrev.add(l);
                  } */
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TimelineScreen(
                            currentJob: widget.currentJob,
                          ),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
