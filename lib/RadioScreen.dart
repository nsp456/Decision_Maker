import 'package:decision_maker/BottomButton.dart';
import 'package:decision_maker/CustomAppBar.dart';
import 'package:flutter/material.dart';

enum Options { Option1, Option2, Option3, Option4 }

TextStyle values = TextStyle(
  fontSize: 20,
);

class RadioScreen extends StatefulWidget {
  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  Options _default = Options.Option1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingActionToBePerformed: () => {Navigator.pop(context)},
        leadingDesign: Icons.arrow_back,
        titletext: "Importance Page",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 5.0,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text(
                      "Select the important attributes from following pair of 2 attributes",
                      style: values,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Option1",
                      style: values,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ListTile(
                      title: Text("Option1"),
                      leading: Radio(
                        value: Options.Option1,
                        groupValue: _default,
                        onChanged: (Options value) {
                          setState(() {
                            _default = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Option2"),
                      leading: Radio(
                        value: Options.Option2,
                        groupValue: _default,
                        onChanged: (Options value) {
                          setState(() {
                            _default = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(pageName: '/third'),
            ],
          ),
        ),
      ),
    );
  }
}
