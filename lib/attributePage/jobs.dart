import 'alternative.dart';
import 'dart:math';

import 'attribute.dart';
import 'package:flutter/foundation.dart';

class Job {
  int attributeNumber = 0;
  int attributeCount = 0;
  String name;
  List<Alternative> alternatives;
  List<Attribute> attrObjects;
  Map<String, List> attributeList;
  List<List<double>> importanceMatrix;
  List<double> weightOfAttribute;
  List<double> indValueOfAlternative;
  List<Alternative> rankingList;

  Job({@required String name}) {
    this.name = name;
    this.attributeCount = 0;
    this.attributeNumber = 0;
    this.attributeList = Map();
    this.alternatives = List();
    this.weightOfAttribute = List();
    this.indValueOfAlternative = List();
    this.rankingList = List();
    this.attrObjects = List();
  }

  bool createAttribute(
      {@required String name, @required bool isHigherValuePreferred}) {
    for (String attrName in this.attributeList.keys) {
      if (name == attrName) {
        return false;
      }
    }
    this.attributeList[name] = [0, isHigherValuePreferred];
    attributeCount++;
    return true;
  }

  bool createAlternative({@required String name, @required List values}) {
    for (Alternative alternative in alternatives) {
      if (alternative.name == name) {
        return false;
      }
    }
    //print("AttributeList $values");
    this.alternatives.add(Alternative(
        name: name, values: values, attributeTemp: this.attributeList));
    return true;
  }

  void setAttributeValues() {
    for (String key in this.attributeList.keys) {
      this.attributeList[key][0] = attributeNumber++;
      this.attrObjects.add(Attribute(name: key, value: 0.0));
    }
  }

  void createImportanceMatrix() {
    //print(this.attributeList);
    //print("Attribute Count is $attributeCount");

    //print("Initialize the Matrix");
    this.importanceMatrix = List();
    for (int i = 0; i < attributeCount; i++) {
      this.importanceMatrix.add(List());
      for (int j = 0; j < attributeCount; j++) {
        if (i == j)
          this.importanceMatrix[i].add(1.0);
        else
          this.importanceMatrix[i].add(0.0);
      }
    }
    //print("Done with Importance Matrix");
  }

  void addImportanceMatrixValue(
      {@required String moreImpAttrName,
      @required String lessImpAttrName,
      @required int value}) {
    int row = this.attributeList[moreImpAttrName][0];
    int column = this.attributeList[lessImpAttrName][0];
    /* print(row);
    print(column);
    print(this.importanceMatrix);
    print(this.attributeList); */
    this.importanceMatrix[row][column] = value.toDouble();
    this.importanceMatrix[column][row] = 1 / value.toDouble();
  }

  void calculateWeights() {
    double geometricMeanSum = 0.0;
    for (List row in this.importanceMatrix) {
      double rowSum = 1.0;
      for (double k in row) {
        //print("K $k");
        rowSum *= k;
      }
      //print("AttributeCount $attributeCount");
      rowSum = pow(rowSum, (1 / (attributeCount)));
      //print("Rowsum is $rowSum");
      weightOfAttribute.add(rowSum);
      geometricMeanSum += rowSum;
    }
    //print("Weight of Attributes $weightOfAttribute");
    for (int i = 0; i < attributeCount; i++) {
      weightOfAttribute[i] = weightOfAttribute[i] / geometricMeanSum;
    }
  }

  void findNormalizedAlternativeValues() {
    Map<String, double> valueSelected = Map<String, double>();
    //print("Initial Value Selected: $valueSelected");
    //print("Alternatives: $alternatives");
    //print("$attributeList");
    for (String attrName in this.attributeList.keys) {
      double val = 0;
      //print("Attrname: $attrName");
      int tempValMaxMin = attributeList[attrName][1] == false ? 1000000000 : 0;
      if (tempValMaxMin == 0) {
        val = 0;
        for (Alternative alt in alternatives) {
          if (alt.returnRespectiveAttributeValue(name: attrName) > val) {
            val = alt.returnRespectiveAttributeValue(name: attrName);
          }
        }
      } else {
        val = 1000000000.0;
        for (Alternative alt in alternatives) {
          //print(alt.returnRespectiveAttributeValue(name: attrName));
          if (alt.returnRespectiveAttributeValue(name: attrName) < val) {
            val = alt.returnRespectiveAttributeValue(name: attrName);
          }
        }
      }
      //print(val);
      valueSelected[attrName] = val;
    }
    //print("value selected: $valueSelected");
    for (String attrName in this.attributeList.keys) {
      for (Alternative alt in alternatives) {
        int i = 0;
        if (attributeList[attrName][1] == false) {
          alt.normalizedValues.add(valueSelected[attrName] /
              alt.returnRespectiveAttributeValue(name: attrName));
          i++;
        } else {
          alt.normalizedValues.add(
              alt.returnRespectiveAttributeValue(name: attrName) /
                  valueSelected[attrName]);
        }
        i++;
      }
    }
  }

  void calculateAlternativeImportance() {
    findNormalizedAlternativeValues();
    for (Alternative alt in alternatives) {
      //print("Norm value ${alt.normalizedValues}");
      double indValue = 0.0;
      for (int i = 0; i < attributeCount; i++) {
        indValue += alt.normalizedValues[i] * weightOfAttribute[i];
      }
      //print("IndValue: $indValue");
      this.indValueOfAlternative.add(indValue);
      alt.indValAlternative = indValue;
    }
  }

  void calculateRanking() {
    List<Alternative> tempList = List();
    Alternative temp;
    for (Alternative alt in alternatives) {
      tempList.add(alt);
    }
    for (int i = 0; i < tempList.length - 1; i++) {
      for (int j = i + 1; j < tempList.length; j++) {
        if (tempList[i].indValAlternative < tempList[j].indValAlternative) {
          temp = tempList[i];
          tempList[i] = tempList[j];
          tempList[j] = temp;
        }
      }
    }
    for (Alternative alt in tempList) {
      this.rankingList.add(alt);
    }
  }
}
