import 'package:flutter/foundation.dart';

class Attribute {
  String name;
  double value;

  Attribute({@required this.name, @required this.value});

  void setVal({@required double value}) {
    this.value = value;
  }

  double getVal() {
    return this.value;
  }
}
