import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, pageName),
      child: Container(
        child: Center(
          child: Text(
            "NEXT STEP",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
        ),
        color: Color(0xff3cae31),
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        height: 70.0,
      ),
    );
  }
}
