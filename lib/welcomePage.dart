import 'package:flutter/material.dart';

import 'login.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final Color logoGreen = Color(0xff25bcbb);
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/dm_logo.jpg',
                height: 250,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome to Decision Maker !',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              SizedBox(height: 20),
              Text(
                'A one-stop portal for all your\ndecision making woes',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                elevation: 0,
                height: 50,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                color: logoGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                textColor: Colors.white,
              ),
              CheckboxListTile(
                title: Text(
                  "Always show this page on startup",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing,
              )
            ],
          ),
        ));
  }
}
