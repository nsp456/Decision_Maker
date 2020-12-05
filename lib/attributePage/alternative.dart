import 'package:flutter/foundation.dart';
import 'attribute.dart';

class Alternative {
  String name;
  List<Attribute> attributes = List<Attribute>();
  double indValAlternative;
  List<double> normalizedValues = List<double>();

  Alternative(
      {@required String name,
      @required List values,
      Map<String, List> attributeTemp = const {}}) {
    this.name = name;
    this.indValAlternative = 0.0;
    if (attributeTemp == {}) {
      this.attributes = List();
    } else {
      //print("values in attribute $values");
      List tempList = attributeTemp.keys.toList();
      for (int i = 0; i < tempList.length; i++) {
        Attribute tempAttr = Attribute(name: tempList[i], value: values[i]);
        attributes.add(tempAttr);
      }
    }
  }

  double returnRespectiveAttributeValue({@required String name}) {
    for (Attribute attr in attributes) {
      if (name == attr.name) return attr.value;
    }
    return 0;
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
