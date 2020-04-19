// Flutter
import 'package:flutter/material.dart';

// Consts
import 'package:covid_tracker/constants/colors.dart';

class StatTile extends StatelessWidget {
  final String name;
  final int value;
  final int deltaValue;

  const StatTile({
    @required this.name,
    @required this.value,
    this.deltaValue
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
            if (deltaValue != null) ...[
              SizedBox(
                height: 4.0,
              ),
              Text(
                "+$deltaValue today",
                style: TextStyle(
                  color: PurpleScheme.mainColorDark,
                  fontSize: 16.0
                ),
              ),
            ]
          ]
        )
      )
    );
  }
}