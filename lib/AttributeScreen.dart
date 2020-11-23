import 'package:decision_maker/BottomButton.dart';
import 'package:flutter/material.dart';
import 'package:decision_maker/AttributeCard.dart';
import 'package:decision_maker/CustomAppBar.dart';

class AttributeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6f8),
      appBar: CustomAppBar(
        leadingDesign: Icons.arrow_back,
        titletext: "Main Title",
        iconDesign: Icons.add,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  AttributeCard(),
                  AttributeCard(),
                  AttributeCard(),
                ],
              ),
            ),
            BottomButton(pageName: '/second'),
          ],
        ),
      ),
    );
  }
}
