import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';

import 'formRandom.dart';
import 'multipleAttributes.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 8 / 10,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Hello Guest !',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/cover.jpg'))),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 13),
                  Icon(Icons.nightlight_round),
                  SizedBox(width: 35),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Dark Theme ',
                        ),
                        WidgetSpan(
                          child: CustomSwitch(
                            activeColor: Colors.green,
                            value: status,
                            onChanged: (value) {
                              print("VALUE : $value");
                              setState(() {
                                status = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text('Take a tour'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('History'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Incomplete'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Login'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //color: Colors.transparent,
      home: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/light_mode.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            backgroundColor: Colors.lightBlue,
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => NavDrawer()),
                  );
                }),
            title: Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          body: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    height: MediaQuery.of(context).size.height * 3 / 10,
                    child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orange)),
                      child: Text(
                        "Many Alternatives \n  with Attributes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () async {
                        List<AlternativeEntry> alternatives =
                            await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SOF(),
                          ),
                        );
                        if (alternatives != null) alternatives.forEach(print);
                      },
                      color: Colors.lightBlueAccent,
                      textColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.purple,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  Container(
                      child: Center(
                    child: Text("OR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  )),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    height: MediaQuery.of(context).size.height * 3 / 10,
                    child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orange)),
                      child: Text(
                        "Randomly choose \nan alternative",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        _navigateToRandomAnswerScreen(context);
                      },
                      color: Colors.lightBlueAccent,
                      textColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToRandomAnswerScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MyForm()));
  }
}
