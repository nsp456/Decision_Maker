import 'package:flutter/material.dart';

import 'AttributeScreen.dart';

final GlobalKey<AttributeScreenState> tp = GlobalKey<AttributeScreenState>();

class IndividualAttributeCard extends StatelessWidget {
  final String nameOfAttributeToBeDisplayed;
  IndividualAttributeCard({@required this.nameOfAttributeToBeDisplayed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -14,
            blurRadius: 7,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Color(0xff3fae2d),
              width: 2.5,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameOfAttributeToBeDisplayed,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
