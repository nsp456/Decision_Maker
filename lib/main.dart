import 'package:flutter/material.dart';
import 'AttributeScreen.dart';
import 'TimelineScreen.dart';
import 'RadioScreen.dart';
import 'SliderScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AttributeScreen(),
        '/second': (contex) => RadioScreen(),
        '/third': (context) => SliderScreen(),
        '/fourth': (context) => TimelineScreen(),
      },
    ),
  );
}
