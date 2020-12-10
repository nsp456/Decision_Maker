/* import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './card.dart';
import './Appbar.dart';

class Incomplete_job extends StatefulWidget {
  @override
  _Incomplete_jobState createState() => _Incomplete_jobState();
}

class _Incomplete_jobState extends State<Incomplete_job> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back, color: Colors.black),
        //     onPressed: () => Navigator.of(context).pop(),
        //   ),
        //   title: Text("Incomplete Job"),
        // ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Incomplete Job"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: App_bar(),
        ),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Alternative_card(
                    alternative_no: "JOB NAME 1",
                    first: "Delete",
                    first_icon: Icons.restore_from_trash,
                    second: "Complete",
                    second_icon: FontAwesomeIcons.edit,
                    t: incomplete_Tag()),
                Alternative_card(
                    alternative_no: "JOB NAME 2",
                    first: "Delete",
                    first_icon: Icons.restore_from_trash,
                    second: "Complete",
                    second_icon: FontAwesomeIcons.edit,
                    t: incomplete_Tag()),
                Alternative_card(
                    alternative_no: "JOB NAME 3",
                    first: "Delete",
                    first_icon: Icons.restore_from_trash,
                    second: "Complete",
                    second_icon: FontAwesomeIcons.edit,
                    t: incomplete_Tag()),
              ],
            )),
      ),
    );
  }

  Text incomplete_Tag() {
    return Text(
      "Incomplete",
      style: TextStyle(backgroundColor: Colors.red[600], color: Colors.white),
    );
  }
}
 */
