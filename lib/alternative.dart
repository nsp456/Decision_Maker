import 'package:flutter/foundation.dart';
import 'attribute.dart';

class Alternative {
  String name;
  List<Attribute> attributes;
  double indValAlternative;

  Alternative({@required String name, Map<String, int> attributes = const {}}) {
    this.name = name;
    this.indValAlternative = 0.0;
    if (attributes == {}) {
      this.attributes = List();
    } else {
      for (String attrName in attributes.keys) {
        this.attributes.add(Attribute(name: attrName, value: 0.0));
      }
    }
  }

  bool editAttributeValue(
      {@required String attrName, @required double changedValue}) {
    for (Attribute attr in attributes) {
      if (attr.name == attrName) {
        attr.setVal(value: changedValue);
        return true;
      }
    }
    return false;
  }
}
