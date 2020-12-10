//import 'package:decision_maker/attributePage/BottomButton.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:decision_maker/Appbar.dart';
//import './card.dart';
//import './incomplete_job.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final String user = auth.currentUser.email;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF5F6F8),
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("History"),
          flexibleSpace: App_bar(),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: db.collection('user').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print(snapshot.data.docs);
                    List tp = List();
                    for (int i = 0; i < snapshot.data.docs.length; i++) {
                      if (user == snapshot.data.docs[i]["email"]) {
                        tp.add(snapshot.data.docs[i]);
                      }
                    }
                    List tempWidget = listOfHistory(tp);
                    return Column(
                      children: tempWidget,
                    );
                    //return Text(tp.toString());
                  } else {
                    print("No Data");
                    return Text("Snapshot Not present");
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

List listOfHistory(List history) {
  List<Widget> jobHistory = List();
  String resAltName = "Name";
  String resAltScore = "Score";
  for (int i = 0; i < history.length; i++) {
    List<ListTile> alt = List();
    //print(history[i]["result"]["job_Name"]);
    dynamic temp = history[i]["result"]["result"];
    for (int j = 0; j < temp.length; j++) {
      //print(temp[(j + 1).toString()]);
      alt.add(
        ListTile(
          leading: Text("Name: ${temp[(j + 1).toString()][resAltName]}",
              style: TextStyle(fontSize: 15.0)),
          trailing: Text(
              "Score: ${(double.tryParse((temp[(j + 1).toString()][resAltScore])) * 10).toStringAsFixed(2)} ⭐",
              style: TextStyle(fontSize: 15.0)),
        ),
      );
    }
    jobHistory.add(ExpansionTile(
      backgroundColor: Colors.white,
      title: Text(
        history[i]["result"]["job_Name"],
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: alt,
    ));
    jobHistory.add(SizedBox(
      height: 20,
    ));
  }
  return jobHistory;
}

/* Text incomplete_Tag() {
  return Text(
    "Completed",
    style: TextStyle(backgroundColor: Colors.green[300]),
  );
} */
