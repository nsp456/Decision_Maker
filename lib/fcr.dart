import 'package:flutter/material.dart';

import 'flipCoin.dart';

class FlipCoinResult extends StatefulWidget {
  @override
  _FlipCoinResultState createState() => _FlipCoinResultState();
}

class _FlipCoinResultState extends State<FlipCoinResult> {
  @override
  String abc = 'pizza';
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        //color: Colors.transparent,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black)),
          color: Colors.greenAccent[200],
          shadowColor: Colors.white,
          elevation: 50,
          margin: EdgeInsets.all(50),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    'It\'s Heads ! \nYou should choose: \n$abc',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  FlatButton(
                    color: Colors.white,
                    minWidth: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FlipCoin()));
                    },
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                          //backgroundColor: Colors.white,
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
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
