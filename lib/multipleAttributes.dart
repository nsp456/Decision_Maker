import 'package:flutter/material.dart';

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var attr1TECs = <TextEditingController>[];
  var attr2TECs = <TextEditingController>[];
  var attr3TECs = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var attr1Controller = TextEditingController();
    var attr2Controller = TextEditingController();
    var attr3Controller = TextEditingController();
    attr1TECs.add(attr1Controller);
    attr2TECs.add(attr2Controller);
    attr3TECs.add(attr3Controller);
    return Card(
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ExpansionTile(
              initiallyExpanded: true,
              title: Text('Alternative ${cards.length + 1}'),
              children: <Widget>[
                TextField(
                    controller: attr1Controller,
                    decoration: InputDecoration(labelText: 'Attribute 1')),
                TextField(
                    controller: attr2Controller,
                    decoration: InputDecoration(labelText: 'Attribute 2')),
                TextField(
                    controller: attr3Controller,
                    decoration: InputDecoration(labelText: 'Attribute 3')),
              ],
            ),
            // Text('Alternative ${cards.length + 1}'),
            // TextField(
            //     controller: attr1Controller,
            //     decoration: InputDecoration(labelText: 'Attribute 1')),
            // TextField(
            //     controller: attr2Controller,
            //     decoration: InputDecoration(labelText: 'Attribute 2')),
            // TextField(
            //     controller: attr3Controller,
            //     decoration: InputDecoration(labelText: 'Attribute 3')),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<AlternativeEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var attr1 = attr1TECs[i].text;
      var attr2 = attr2TECs[i].text;
      var attr3 = attr3TECs[i].text;
      entries.add(AlternativeEntry(attr1, attr2, attr3));
    }
    Navigator.pop(context, entries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('With Attributes'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text('Add New Alternative'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}

class AlternativeEntry {
  final String attr1;
  final String attr2;
  final String studyattr3;

  AlternativeEntry(this.attr1, this.attr2, this.studyattr3);
  @override
  String toString() {
    return 'alternative: attr1= $attr1, attr2= $attr2, study attr3= $studyattr3';
  }
}
