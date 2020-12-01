import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'formRandom.dart';

class AnimationPage extends StatefulWidget {
  String choice;
  AnimationPage(String choice) {
    this.choice = choice;
  }
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  AnimationController _a1, _a2;
  CurvedAnimation _c1, _c2;
  bool _isAnimating = true;

  @override
  void initState() {
    super.initState();

    _a1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _a2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _c1 = CurvedAnimation(parent: _a1, curve: Curves.fastOutSlowIn);
    _c2 = CurvedAnimation(parent: _a2, curve: Curves.fastOutSlowIn);
  }

  void _startAnimation() {
    _a1.forward().then((value) => _a2.forward());
    setState(() {
      _isAnimating = false;
    });
  }

  void _reverseAnimation() {
    _a2.reverse().then((value) => _a1.reverse());
    setState(() {
      _isAnimating = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        // margin: EdgeInsets.only(
        //     left: (MediaQuery.of(context).size.width - 00) / 2,
        //     top: (MediaQuery.of(context).size.height - 600) / 2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: _isAnimating ? _startAnimation : _reverseAnimation,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      AnimatedBuilder(
                        animation: _c1,
                        builder: (context, child) {
                          final value1 = _c1.value;
                          return AnimatedBuilder(
                            animation: _c2,
                            builder: (context, child) {
                              final value2 = _c2.value;
                              return CustomPaint(
                                painter: ShapePainter(
                                    choice: widget.choice,
                                    value1: value1,
                                    value2: value2),
                                child: child,
                              );
                            },
                          );
                        },
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              FlatButton(
                color: Colors.white,
                minWidth: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyForm()));
                },
                child: Text(
                  'Go Back',
                  style: TextStyle(
                      //backgroundColor: Colors.white,
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final String choice;
  final double value1;
  final double value2;

  ShapePainter(
      {@required this.choice, @required this.value1, @required this.value2});

  @override
  void paint(Canvas canvas, Size size) {
    final isOpen = value1 == 1;

    // Paints
    var openSheetPaint = Paint()..color = Colors.white;
    var staticOpenSheetPaint = Paint()..color = Colors.grey[100];
    // var textPaint = Paint()
    //   ..color = Colors.brown
    //   ..strokeWidth = 2;
    var staticSheetPaint1 = Paint()..color = Colors.grey[200];
    var staticSheetPaint2 = Paint()..color = Colors.grey[300];
    var letterPaint = Paint()..color = Colors.blue[700];
    var transparentPaint = Paint()..color = Colors.transparent;

    // Paths
    var staticOpenSheetPath = Path()
      ..addPolygon([
        Offset(0, 0),
        Offset(200, 0),
        Offset(200, 50),
        Offset(100, 100),
        Offset(0, 50),
      ], true);

    var openSheetPath = Path()
      ..addPolygon([
        Offset(0, 0),
        Offset(200, 0),
        Offset(200, 50 + (-100 * value1)),
        Offset(100, 100 + (-200 * value1)),
        Offset(0, 50 + (-100 * value1)),
      ], true);

    var staticSheetPath1 = Path()
      ..addPolygon([
        Offset(0, 50),
        Offset(200, 150),
        Offset(0, 150),
      ], true);

    var staticSheetPath2 = Path()
      ..addPolygon([
        Offset(200, 50),
        Offset(200, 150),
        Offset(0, 150),
      ], true);

    var letterPath = Path()
      ..addRect(Rect.fromPoints(
          Offset(20, 20 + (-60 * value2)),
          Offset(
            180,
            130 + (-60 * value2),
          )));

    canvas.drawPath(staticOpenSheetPath, staticOpenSheetPaint);
    canvas.drawPath(openSheetPath, openSheetPaint);

    canvas.drawPath(letterPath, letterPaint); // letter sheet
    // canvas.drawLine(Offset(40, 40 + (-60 * value2)),
    //     Offset(160, 40 + (-60 * value2)), textPaint); // letter text 1
    // canvas.drawLine(Offset(40, 50 + (-60 * value2)),
    //     Offset(160, 50 + (-60 * value2)), textPaint); // letter text 2
    // canvas.drawLine(Offset(40, 60 + (-60 * value2)),
    //     Offset(160, 60 + (-60 * value2)), textPaint); // letter text 3
    // canvas.drawLine(Offset(120, 100 + (-60 * value2)),
    //     Offset(160, 100 + (-60 * value2)), textPaint); // letter text 4
    // canvas.drawLine(Offset(120, 110 + (-60 * value2)),
    //     Offset(160, 110 + (-60 * value2)), textPaint); // letter text 4
    // Text(
    //   'You should choose: \n$choice',
    //   style: TextStyle(
    //       fontFamily: 'OpenSans', fontSize: 30, fontWeight: FontWeight.bold),
    //   textAlign: TextAlign.center,
    // );
    // TextSpan span = new TextSpan(
    //     style: new TextStyle(color: Colors.grey[600]),
    //     text: 'You should choose: \n$choice');
    // TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left);
    // tp.layout();
    // tp.paint(canvas, new Offset(5.0, 5.0));

    !isOpen
        ? canvas.drawPath(openSheetPath, openSheetPaint)
        : canvas.drawPath(openSheetPath, transparentPaint);

    final paragraphStyle = ParagraphStyle(textAlign: TextAlign.center);
    //final textStyle = TextStyle(color: Colors.white);
    final paragraphBuilder = ParagraphBuilder(paragraphStyle)
      //..pushStyle(textStyle)
      ..addText('You should choose: \n$choice');
    final paragraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: 300));
    canvas.drawParagraph(paragraph, Offset(-50, 0));
    canvas.drawPath(staticSheetPath1, staticSheetPaint1);
    canvas.drawPath(staticSheetPath2, staticSheetPaint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
