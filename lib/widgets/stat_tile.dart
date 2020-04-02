// Flutter
import 'package:flutter/material.dart';

// Consts
import 'package:covid_tracker/constants/colors.dart';

class StatTile extends StatelessWidget {
  final String name;
  final int value;

  const StatTile({this.name, this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            Text(
              "$name",
              style: TextStyle(
                color: PurpleScheme.mainColorDark,
                fontSize: 18.0
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "$value",
              style: TextStyle(
                color: PurpleScheme.mainColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 30.0
              ),
            ),
          ]
        )
      )
    );
  }
}