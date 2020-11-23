import 'package:decision_maker/BottomButton.dart';
import 'package:flutter/material.dart';
import 'package:decision_maker/CustomAppBar.dart';

TextStyle values = TextStyle(
  fontSize: 20,
);

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int value = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingActionToBePerformed: () => {Navigator.pop(context)},
        leadingDesign: Icons.arrow_back,
        titletext: "Importance Page",
        iconDesign: Icons.save,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Enter the Importance",
                style: values,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  Text(
                    "Option 1",
                    style: values,
                  ),
                  Text(
                    "Attribute 2 is important than attribute 1 by:",
                    style: values,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Color(0xFF3CAE30),
                  thumbColor: Color(0xFF28B1BB),
                  overlayColor: Color(0x47C5CE),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: value.toDouble(),
                  min: 1.0,
                  max: 9.0,
                  divisions: 9,
                  label: value.round().toString(),
                  onChanged: (double nv) {
                    setState(() {
                      value = nv.round();
                    });
                  },
                ),
              ),
            ),
            BottomButton(pageName: '/fourth'),
          ],
        ),
      ),
    );
  }
}
