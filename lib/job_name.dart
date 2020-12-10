import 'package:flutter/material.dart';
//import './incomplete_job.dart';
import './History.dart';
import './Appbar.dart';

class Job_name extends StatefulWidget {
  @override
  _Job_nameState createState() => _Job_nameState();
}

class _Job_nameState extends State<Job_name> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Job Name"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.add),
            )
          ],
          flexibleSpace: App_bar(),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Attribute(Attr_no: 1),
              Attribute(Attr_no: 2),
              Attribute(Attr_no: 3),
              Attribute(Attr_no: 4),
              Attribute(Attr_no: 5),
              Attribute(Attr_no: 6),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => History()));
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

class Attribute extends StatelessWidget {
  int Attr_no;
  Attribute({@required this.Attr_no});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.transparent),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 3,
                      height: 30,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 20, 30),
                      child: Text(
                        "$Attr_no. Attribute $Attr_no",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.restore_from_trash,
                          color: Colors.red,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(color: Colors.red, fontSize: 13),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
              color: Colors.grey[200],
              blurRadius: 10.0,
              offset: Offset(0.0, 10)),
        ],
      ),
    );
  }
}
