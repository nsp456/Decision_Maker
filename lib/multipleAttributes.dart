import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card.dart';
import 'Appbar.dart';

class MultipleAttributes extends StatelessWidget {
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
          title: Text("With Attributes"),
          flexibleSpace: App_bar(),
        ),
        body: Page(),
        // body: Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Enter the name for Decision making job",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: 'Enter Name Here',
                      hintStyle: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Container(
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: BorderSide(color: Colors.transparent)),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Alternative())),
                        },
                        fillColor: Colors.green,
                        splashColor: Colors.greenAccent,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "Go",
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.grey[500],
                              blurRadius: 20.0,
                              offset: Offset(-3.0, 5))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
