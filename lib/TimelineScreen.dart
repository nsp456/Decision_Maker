import 'package:decision_maker/CustomAppBar.dart';
import 'package:decision_maker/TimelineCard.dart';
import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingActionToBePerformed: () => {Navigator.pop(context)},
        leadingDesign: Icons.arrow_back,
        titletext: "Result",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimelineCard(
                type: "green",
                leftChildString: "",
                rightChildString: "Ranked Alt 1",
              ),
              TimelineCard(
                type: "blue",
                leftChildString: "Ranked Alt2 ",
                rightChildString: "",
              ),
              TimelineCard(
                type: "green",
                leftChildString: "",
                rightChildString: "Ranked Alt 3",
              ),
              TimelineCard(
                type: "blue",
                leftChildString: "Ranked Alt 4",
                rightChildString: "",
              ),
              TimelineCard(
                type: "green",
                leftChildString: "",
                rightChildString: "Ranked Alt 5",
              ),
              TimelineCard(
                type: "blue",
                leftChildString: "Ranked Alt 6",
                rightChildString: "",
              ),
              TimelineCard(
                type: "green",
                leftChildString: "",
                rightChildString: "Ranked Alt 7",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
