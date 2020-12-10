import 'package:decision_maker/DialogBox.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'TimesScreen.dart';
import 'package:decision_maker/Appbar.dart';
import 'BottomButton.dart';
import 'jobs.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class ImportanceScreen extends StatefulWidget {
  Job currentJob;

  ImportanceScreen({@required this.currentJob});
  @override
  _ImportanceScreenState createState() => _ImportanceScreenState();
}

class _ImportanceScreenState extends State<ImportanceScreen> {
  List<String> impAttr = List<String>();

  List<List<String>> listRadioButtonGroup = List();
  List<String> picked = List();

  bool pickedContainsNull() {
    for (int i = 0; i < picked.length; i++) {
      if (picked[i] == null) {
        return true;
      }
    }
    return false;
  }

  void createAttributeGroups() {
    List<String> tempList = widget.currentJob.attributeList.keys.toList();
    //print(tempList);
    for (int i = 0; i < tempList.length; i++) {
      //print("i:$i");
      for (int j = i + 1; j < tempList.length; j++) {
        //print("j:$j,${tempList[i]},${tempList[j]}");
        listRadioButtonGroup.add([tempList[i], tempList[j]]);
        picked.add(null);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    createAttributeGroups();
    //print(listRadioButtonGroup);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Determine Importance"),
        flexibleSpace: App_bar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listRadioButtonGroup.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Select the more important from below",
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        RadioButtonGroup(
                          orientation: GroupedButtonsOrientation.HORIZONTAL,
                          labels: listRadioButtonGroup[index],
                          //picked: picked[index],
                          onSelected: (String selected) {
                            picked[index] = selected;
                          },
                          itemBuilder: (Radio rb, Text txt, int i) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  rb,
                                  txt,
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        )
                      ],
                    );
                  },
                ),
              ),
              BottomButton(
                  buttonName: "NEXT STEP",
                  funName: () {
                    if (!pickedContainsNull()) {
                      impAttr = List();
                      for (int i = 0; i < picked.length; i++) {
                        impAttr.add(picked[i]);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TimesScreen(
                            currentJob: widget.currentJob,
                            impAttr: impAttr,
                            attrGroups: listRadioButtonGroup,
                          ),
                        ),
                      );
                    } else {
                      /* Alert(
                        context: context,
                        title: "ERROR",
                        desc: "Please Select Importance for all options",
                      ).show() */
                      showAlertDialog(
                          context, "Please Select Importance for all options");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
