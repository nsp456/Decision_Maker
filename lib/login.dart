import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;
final Color primaryColor = Color(0xff18203d);
final GoogleSignIn googleSignIn = GoogleSignIn();

class Signout {
  Future signout() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  // SharedPreferences sharedPreferences;

  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);

  bool checkedValue = true;

  String username, password;
  bool s = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: s,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign in to continue',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter your email and password below to continue to the app and start making decisions !',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      border: Border.all(color: Colors.blue)),
                  child: TextField(
                    onChanged: (value) => {username = value, print(value)},
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 20),
                // _buildTextField(Icons.lock, 'Password', true, password),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      border: Border.all(color: Colors.blue)),
                  child: TextField(
                    onChanged: (value) => {password = value, print(value)},
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 10),
                CheckboxListTile(
                  title: Text(
                    "Remember me",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  checkColor: Colors.white,
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    MaterialButton(
                      elevation: 0,
                      minWidth: MediaQuery.of(context).size.width * 0.25,
                      height: 50,
                      onPressed: () async {
                        setState(() {
                          s = true;
                        });

                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: username, password: password);

                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(username),
                              ),
                            );
                          } else {
                            print('Invalid Entry');
                          }
                          setState(() {
                            s = false;
                          });
                        } catch (e) {}
                      },
                      color: logoGreen,
                      child: Text('Login',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      textColor: Colors.white,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    MaterialButton(
                      elevation: 0,
                      minWidth: MediaQuery.of(context).size.width * 0.25,
                      height: 50,
                      onPressed: () async {
                        setState(() {
                          s = true;
                        });
                        print(username);
                        try {
                          final user =
                              await _auth.createUserWithEmailAndPassword(
                                  email: username, password: password);
                          final u = user.user;

                          setState(() {
                            s = false;
                          });
                          if (u != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(username),
                              ),
                            );
                          } else {
                            print('Invalid Entry');
                          }
                        } catch (e) {}
                      },
                      color: logoGreen,
                      child: Text('Register',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async {
                    setState(() {
                      s = true;
                    });

                    // print('hey');

                    final GoogleSignInAccount googleUser =
                        await googleSignIn.signIn();

                    // print('1--------------------------------');
                    final GoogleSignInAuthentication googleAuthentication =
                        await googleUser.authentication;
                    // print('1----------------------------');
                    final GoogleAuthCredential credential =
                        GoogleAuthProvider.credential(
                            idToken: googleAuthentication.idToken,
                            accessToken: googleAuthentication.accessToken);
                    // print('1-------------------------');
                    UserCredential firebaseUser =
                        (await _auth.signInWithCredential(credential));
                    // print('1---------------------------');
                    final user = firebaseUser.user;

                    setState(() {
                      s = false;
                    });
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(username),
                        ),
                      );
                    }
                  },
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      SizedBox(width: 10),
                      Text('Sign-in using Google',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/dm_logo.jpg',
                        height: 40,
                      ),
                      Text(
                        '    Decision Maker App',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTextField(IconData icon, String labelText, bool obsText, String data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        onChanged: (value) => {data = value, print(value)},
        obscureText: obsText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
