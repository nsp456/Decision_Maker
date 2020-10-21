import 'package:flutter/material.dart';

class App_bar extends StatefulWidget {
  @override
  _App_barState createState() => _App_barState();
}

class _App_barState extends State<App_bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.green, Colors.blue])),
    );
  }
}
