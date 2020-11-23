//import 'package:decision_maker/attribute.dart';
import 'package:flutter/foundation.dart';
import 'alternative.dart';
import 'dart:math';

class Job {
  static int attributeNumber = 0;
  static int attributeCount = 0;
  String name;
  List<Alternative> alternatives;
  Map<String, int> attributeList;
  List<List<double>> importanceMatrix;
  List<double> weightOfAttribute;
  bool isValid = true;
  List<double> indValueOfAlternative;
  List<Alternative> rankingList;
  static Map<int, double> ri = {
    3: 0.52,
    4: 0.89,
    5: 1.11,
    6: 1.25,
    7: 1.35,
    8: 1.8,
    9: 1.45
  };

  Job({@required String name}) {
    this.name = name;
    this.attributeList = Map();
    this.alternatives = List();
    this.weightOfAttribute = List();
    this.indValueOfAlternative = List();
    this.rankingList = List();
  }

  bool createAttribute({@required String name}) {
    for (String attrName in this.attributeList.keys) {
      if (name == attrName) {
        return false;
      }
    }
    this.attributeList[name] = 0;
    attributeCount++;
    return true;
  }

  bool deleteAttribute({@required String name}) {
    for (String attrName in this.attributeList.keys) {
      if (attrName == name) {
        this.attributeList.remove(name);
        attributeCount--;
        return true;
      }
    }
    return false;
  }

  bool createAlternative({@required String name}) {
    for (Alternative alternative in alternatives) {
      if (alternative.name == name) {
        return false;
      }
    }
    this
        .alternatives
        .add(Alternative(name: name, attributes: this.attributeList));
    return true;
  }

  bool editAttributeAlternativeName(
      {@required String altName,
      @required String attrName,
      @required double val}) {
    bool isAvailable = false;
    Alternative temp;
    String attName;
    for (Alternative alternative in this.alternatives) {
      if (alternative.name == altName) {
        temp = alternative;
        isAvailable = true;
        break;
      }
    }
    if (!isAvailable) {
      return false;
    }
    isAvailable = false;
    for (String name in this.attributeList.keys) {
      if (name == attrName) {
        attName = name;
        isAvailable = true;
        break;
      }
    }
    if (!isAvailable) {
      return false;
    }
    bool res = temp.editAttributeValue(attrName: attName, changedValue: val);
    return res;
  }

  void createImportanceMatrix() {
    for (String key in this.attributeList.keys) {
      this.attributeList[key] = attributeNumber++;
    }
    this.importanceMatrix = List();
    for (int i = 0; i < attributeCount; i++) {
      this.importanceMatrix.add(List());
      for (int j = 0; j < attributeCount; j++) {
        if (i == j)
          this.importanceMatrix[j].add(1.0);
        else
          this.importanceMatrix[j].add(0.0);
      }
    }
  }

  void addImportanceMatrixValue(
      {@required String moreImpAttrName,
      @required String lessImpAttrName,
      @required int value}) {
    int row = this.attributeList[moreImpAttrName];
    int column = this.attributeList[lessImpAttrName];
    this.importanceMatrix[row][column] = value.toDouble();
    this.importanceMatrix[column][row] = 1 / value.toDouble();
  }

  void calculateWeights() {
    double geometricMeanSum = 0.0;
    for (List row in this.importanceMatrix) {
      double rowSum = 1.0;
      for (double k in row) {
        rowSum *= k;
        rowSum = pow(rowSum, 1 / attributeCount);
        weightOfAttribute.add(rowSum);
      }
      geometricMeanSum += rowSum;
    }
    for (int i = 0; i < attributeCount; i++) {
      weightOfAttribute[i] = weightOfAttribute[i] / geometricMeanSum;
    }
    bool res = validateWeights();
    if (res)
      this.isValid = true;
    else
      this.isValid = false;
  }

  bool validateWeights() {
    List<double> a3 = List();
    List<double> a4 = List();
    double lambdaMax = 0.0;
    double cr = 0.0;
    double ci = 0.0;
    for (List<double> row in this.importanceMatrix) {
      double tempSum = 0.0;
      for (int i = 0; i < attributeCount; i++) {
        tempSum += row[0] * weightOfAttribute[0];
      }
      a3.add(tempSum);
    }
    for (int i = 0; i < attributeCount; i++) {
      a4.add(a3[i] / weightOfAttribute[i]);
    }
    for (int i = 0; i < attributeCount; i++) {
      lambdaMax += a4[i];
    }
    lambdaMax = lambdaMax / attributeCount;
    ci = (lambdaMax - attributeCount) / (attributeCount - 1);
    cr = ci / ri[attributeCount];
    if (cr < 0.1)
      return true;
    else
      return false;
  }

  void calculateAlternativeImportance() {
    for (Alternative alt in alternatives) {
      double indValue = 0.0;
      for (int i = 0; i < attributeCount; i++) {
        indValue += alt.attributes[i].value * weightOfAttribute[i];
      }
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
    for (int i = 0; i < tempList.length; i++) {
      for (int j = i + 1; j < tempList.length - 1; j++) {
        if (tempList[i].indValAlternative > tempList[j].indValAlternative) {
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

  Alternative randomAnswerGenerator() {
    int length = alternatives.length;
    Random random = Random();
    return alternatives[random.nextInt(length - 1)];
  }
}
