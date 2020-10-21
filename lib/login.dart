import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'OpenSans', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: (TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/images/icon.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  emailField,
                  SizedBox(height: 20.0),
                  passwordField,
                  SizedBox(
                    height: 30.0,
                  ),
                  loginButon,
                  SizedBox(
                    height: 10.0,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Not registered yet? ',
                          style: TextStyle(fontSize: 20),
                        ),
                        WidgetSpan(
                          child: RaisedButton(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            },
                          ),
                        ),
                      ],
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
}
