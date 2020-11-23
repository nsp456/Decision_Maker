import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

const TextStyle textval = TextStyle(
  fontSize: 15,
);

const LineStyle CommonLineStyle = LineStyle(
  color: Color(0xff212c35),
  thickness: 12,
);

IndicatorStyle onlyGreen = IndicatorStyle(
  width: 45,
  color: Color(0xff3cae31),
  padding: EdgeInsets.all(3),
);

IndicatorStyle onlyBlue = IndicatorStyle(
  width: 45,
  color: Color(0xff28b1bb),
  padding: EdgeInsets.all(3),
);

class TimelineCard extends StatelessWidget {
  TimelineCard({
    @required this.type,
    this.leftChildString,
    this.rightChildString,
  });

  final String type;
  final String leftChildString;
  final String rightChildString;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis: TimelineAxis.vertical,
      alignment: TimelineAlign.center,
      beforeLineStyle: CommonLineStyle,
      afterLineStyle: CommonLineStyle,
      indicatorStyle: type == "green" ? onlyGreen : onlyBlue,
      endChild: Container(
        color: Colors.white,
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: Text(
            rightChildString,
            style: textval,
          ),
        ),
      ),
      startChild: Container(
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              leftChildString,
              style: textval,
            ),
          ),
        ),
      ),
    );
  }
}
