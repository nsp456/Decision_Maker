import 'dart:ui';
import 'package:flutter/material.dart';

import 'AlternativeScreen.dart';
import 'package:decision_maker/Appbar.dart';
import 'BottomButton.dart';
import 'jobs.dart';

class TimesScreen extends StatefulWidget {
  Job currentJob;
  List<String> impAttr;
  List<List<String>> attrGroups;
  List<int> importance = List<int>();

  TimesScreen(
      {@required this.currentJob,
      @required this.impAttr,
      @required this.attrGroups});
  @override
  _TimesScreenState createState() => _TimesScreenState();
}

class _TimesScreenState extends State<TimesScreen> {
  List<int> respImp = List();
  bool doneOnce = false;

  String remainAttr(int index) {
    if (widget.attrGroups[index][0] == widget.impAttr[index])
      return widget.attrGroups[index][1];
    else
      return widget.attrGroups[index][0];
  }

  @override
  Widget build(BuildContext context) {
    //print("Some1 ${widget.impAttr}");
    //print("Some2 ${widget.attrGroups}");
    for (int i = 0; i < widget.impAttr.length; i++) {
      respImp.add(5);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Select Importance"),
        flexibleSpace: App_bar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.impAttr.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Column(
                        children: [
                          Text(
                            "${widget.impAttr[index]} is x times more important than ${remainAttr(index)}, x is:",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Color(0xFF3CAE30),
                              thumbColor: Color(0xFF28B1BB),
                              overlayColor: Color(0x47C5CE),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: respImp[index].toDouble(),
                              min: 1.0,
                              max: 9.0,
                              divisions: 9,
                              label: respImp[index].round().toString(),
                              onChanged: (double nv) {
                                setState(() {
                                  respImp[index] = nv.round();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              BottomButton(
                  buttonName: "ADD ALTERNATIVE",
                  funName: () {
                    if (!doneOnce) {
                      widget.currentJob.setAttributeValues();
                      doneOnce = true;
                    }
                    widget.currentJob.createImportanceMatrix();
                    //print(widget.attrGroups.length);
                    for (int i = 0; i < widget.attrGroups.length; i++) {
                      //print(i);
                      //print(respImp[i]);
                      //print(widget.impAttr[i]);
                      widget.currentJob.addImportanceMatrixValue(
                          moreImpAttrName: widget.impAttr[i],
                          lessImpAttrName: remainAttr(i),
                          value: respImp[i]);
                    }
                    //print(widget.currentJob.importanceMatrix);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AlternativeScreen(currentJob: widget.currentJob),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
