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

  TimelineScreen({@required this.currentJob});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
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
                      Map<int, Map<String, dynamic>> result =
                          Map<int, Map<String, dynamic>>();
                      for (int i = 0; i < currentJob.rankingList.length; i++) {
                        result[i + 1] = {
                          "Name": currentJob.rankingList[i].name,
                          "Score": currentJob.rankingList[i].indValAlternative
                        };
                      }
                      //print(result);
                      Map<String, dynamic> finResult = {
                        "job_Name": currentJob.name,
                        "result": result
                      };
                      print(finResult);
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
