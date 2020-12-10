/* import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';

/*class AttributeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      // <-- Provides ExpandableController to its children
      child: Column(
        children: [
          Expandable(
            // <-- Driven by ExpandableController from ExpandableNotifier
            collapsed: ExpandableButton(
              // <-- Expands when tapped on the cover photo
              child: Text("Ankit"),
            ),
            expanded: Column(children: [
              Text("WOW"),
              ExpandableButton(
                // <-- Collapses when tapped on
                child: Text("Back"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}*/

class AttributeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: -14,
                blurRadius: 7,
                offset: Offset(0, 5),
              )
            ]),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(10.0),
        child: Expandable(
          collapsed: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color(0xff3fae2d),
                        width: 2.5,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Alternative Number",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      ExpandableButton(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 26.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.mode_edit,
                        size: 26.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Edit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.delete,
                        size: 26.0,
                        color: Colors.red,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "Delete",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          expanded: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color(0xff3fae2d),
                        width: 2.5,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Alternative Number",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      ExpandableButton(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          size: 26.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Attribute 1"),
                      Text("Attribute 2"),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.mode_edit,
                        size: 26.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Edit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 175.0),
                      Icon(
                        Icons.delete,
                        size: 26.0,
                        color: Colors.red,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "Delete",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
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
 */
