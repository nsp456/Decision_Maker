import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ia/Appbar.dart';
import './card.dart';
import './incomplete_job.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
          title: Text("History"),
          flexibleSpace: App_bar(),
        ),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Alternative_card(
                    alternative_no: "Job Name 1",
                    iconData: Icons.remove_red_eye,
                    first_icon: Icons.restore_from_trash,
                    first: "Delete",
                    second: "Reuse",
                    second_icon: FontAwesomeIcons.redo,
                    t: incomplete_Tag()),
                Alternative_card(
                    alternative_no: "Job Name 2",
                    iconData: Icons.remove_red_eye,
                    first_icon: Icons.restore_from_trash,
                    first: "Delete",
                    second: "Reuse",
                    second_icon: FontAwesomeIcons.redo,
                    t: incomplete_Tag())
              ],
            )),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Incomplete_job()));
            },
            color: Colors.green,
            textColor: Colors.white,
            child: Text('CALCULATE RESULT'),
          ),
        ),
      ),
    );
  }
}

Text incomplete_Tag() {
  return Text(
    "Completed",
    style: TextStyle(backgroundColor: Colors.green[300]),
  );
}
