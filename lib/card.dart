/* import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './job_name.dart';
import './Appbar.dart';

class Alternative extends StatefulWidget {
  @override
  _AlternativeState createState() => _AlternativeState();
}

class _AlternativeState extends State<Alternative> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: App_bar(),
          title: Text("Alteratives"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   // crossAxisAlignment: CrossAxisAlignment.center,
          //   children: <Widget>[
          //     Alternative_card(alternative_no: 1),
          //     Alternative_card(alternative_no: 2)
          //   ],
          // ),
          child: ListView(
            children: <Widget>[
              Alternative_card(
                alternative_no: "Alternative 1",
                iconData: Icons.arrow_drop_down_circle,
                second: "Edit",
                second_icon: FontAwesomeIcons.pen,
                first: "Delete",
                first_icon: Icons.restore_from_trash,
              ),
              SizedBox(
                height: 10,
              ),
              Alternative_card(
                alternative_no: "Alternative 2",
                iconData: Icons.arrow_drop_down_circle,
                second: "Edit",
                second_icon: FontAwesomeIcons.pen,
                first: "Delete",
                first_icon: Icons.restore_from_trash,
              ),
              SizedBox(
                height: 10,
              ),
              Alternative_card(
                alternative_no: "Alternative 3",
                iconData: Icons.arrow_drop_down_circle,
                second: "Edit",
                second_icon: FontAwesomeIcons.pen,
                first: "Delete",
                first_icon: Icons.restore_from_trash,
              ),
              SizedBox(
                height: 10,
              ),
              Alternative_card(
                alternative_no: "Alternative 4",
                iconData: Icons.arrow_drop_down_circle,
                second: "Edit",
                second_icon: FontAwesomeIcons.pen,
                first: "Delete",
                first_icon: Icons.restore_from_trash,
              ),
              SizedBox(
                height: 10,
              ),
              Alternative_card(
                alternative_no: "Alternative 5",
                iconData: Icons.arrow_drop_down_circle,
                second: "Edit",
                second_icon: FontAwesomeIcons.pen,
                first: "Delete",
                first_icon: Icons.restore_from_trash,
              ),
              SizedBox(
                height: 10,
              ),
              Alternative_card(
                alternative_no: "Alternative 6",
                iconData: Icons.arrow_drop_down_circle,
                second: "Edit",
                second_icon: FontAwesomeIcons.pen,
                first: "Delete",
                first_icon: Icons.restore_from_trash,
              ),
              SizedBox(
                height: 10,
              ),
              Alternative_card(
                alternative_no: "Alternative 7",
                iconData: Icons.arrow_drop_down_circle,
                second: "Edit",
                second_icon: FontAwesomeIcons.pen,
                first: "Delete",
                first_icon: Icons.restore_from_trash,
              ),
              SizedBox(
                height: 10,
              ),
              Alternative_card(
                alternative_no: "Alternative 8",
                iconData: Icons.arrow_drop_down_circle,
                second: "Edit",
                second_icon: FontAwesomeIcons.pen,
                first: "Delete",
                first_icon: Icons.restore_from_trash,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Job_name()));
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

class Alternative_card extends StatefulWidget {
  String alternative_no;
  String first, second;
  IconData iconData, first_icon, second_icon;
  Text t;
  Alternative_card(
      {@required this.alternative_no,
      this.iconData,
      this.first_icon,
      this.second_icon,
      this.first,
      this.second,
      this.t});

  @override
  _Alternative_cardState createState() => _Alternative_cardState();
}

class _Alternative_cardState extends State<Alternative_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Card(
            // color: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 10, 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 3,
                            height: 25,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.alternative_no,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          widget.t != null ? widget.t : Text(""),
                        ],
                      ),
                      Icon(
                        widget.iconData,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          widget.first_icon,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          widget.first,
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          widget.second_icon,
                          size: 15.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          widget.second,
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
              color: Colors.grey[200],
              blurRadius: 10.0,
              offset: Offset(0.0, 5)),
        ],
      ),
    );
  }
}
 */
