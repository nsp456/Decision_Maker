import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

import '../Appbar.dart';
import 'BottomButton.dart';
import 'TimelineCard.dart';
import 'alternative.dart';
import 'jobs.dart';
import '../home.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TimelineScreen extends StatelessWidget {
  Job currentJob;
  List<Alternative> finalList = List();
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  TimelineScreen({@required this.currentJob});
  @override
  Widget build(BuildContext context) {
    final User user = auth.currentUser;
    //print("IndvalueOfAlternatibe ${currentJob.indValueOfAlternative}");
    //print("ranking: ${currentJob.rankingList}");
    finalList = currentJob.rankingList.toList();
    return Scaffold(
        appBar: AppBar(
          title: Text("Final Result: ${currentJob.name}"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: App_bar(),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (BuildContext context, int index) {
                    String type = index % 2 == 0 ? "green" : "blue";
                    //String toSend =
                    //  "Ranked Alternative ${index + 1} is ${finalList[index].name} scoring ${(finalList[index].indValAlternative * 10).toStringAsFixed(2)}";
                    String leftChild =
                        "Ranked Alternative ${index + 1} is:\n${finalList[index].name}";
                    String rightChild =
                        "Scoring ${(finalList[index].indValAlternative * 10).toStringAsFixed(2)} ⭐ / 10⭐";
                    return TimelineCard(
                      type: type,
                      leftChildString: leftChild,
                      rightChildString: rightChild,
                    );
                  },
                )),
                BottomButton(
                    buttonName: "GO BACK TO HOME",
                    funName: () {
                      Map<String, Map<String, dynamic>> result =
                          Map<String, Map<String, dynamic>>();
                      for (int i = 0; i < currentJob.rankingList.length; i++) {
                        result[(i + 1).toString()] = {
                          "Name": currentJob.rankingList[i].name,
                          "Score": currentJob.rankingList[i].indValAlternative
                              .toString(),
                        };
                      }
                      //print(result);
                      Map<String, dynamic> finResult = {
                        "job_Name": currentJob.name,
                        "result": result
                      };
                      print(finResult);
                      _firestore.collection('user').add({
                        "email": user.email,
                        "result": finResult,
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyHomePage(auth.currentUser.email)),
                          (Route<dynamic> route) => false);
                    })
              ],
            ),
          ),
        ));
  }
}
