import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar(
      {this.leadingActionToBePerformed,
      @required this.leadingDesign,
      @required this.titletext,
      this.toBePerformed,
      this.iconDesign})
      : preferredSize = Size.fromHeight(55.0);

  @override
  final Size preferredSize;
  final Function toBePerformed;
  final IconData iconDesign;
  final String titletext;
  final IconData leadingDesign;
  final Function leadingActionToBePerformed;
  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      title: Text(titletext),
      automaticallyImplyLeading: true,
      backgroundColorStart: Color(0xff3cae30),
      backgroundColorEnd: Color(0xff28b1bb),
      leading: GestureDetector(
        onTap: leadingActionToBePerformed,
        child: Icon(
          leadingDesign,
          size: 26.0,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: toBePerformed,
            child: Icon(
              iconDesign,
              size: 26.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
