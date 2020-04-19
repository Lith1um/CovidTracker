// Libs
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

// Widgets
import 'package:covid_tracker/widgets/stat_tile.dart';

// Models
import 'package:covid_tracker/models/global_covid.dart';

// Constants
import 'package:covid_tracker/constants/colors.dart';

class GlobalStats extends StatelessWidget {
  final GlobalCovid stats;

  const GlobalStats({@required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatTile(
              name: 'Cases',
              value: stats.cases,
              deltaValue: stats.todayCases,
            ),
            StatTile(
              name: 'Deaths',
              value: stats.deaths,
              deltaValue: stats.todayDeaths,
            ),
          ]
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatTile(
              name: 'Recovered',
              value: stats.recovered
            ),
            StatTile(
              name: 'Active',
              value: stats.active
            ),
          ]
        ),
        SizedBox(height: 8.0),
        Center(
          child: Text(
            'Last updated: ${getDateTime(stats.updated)}',
            style: TextStyle(
              color: PurpleScheme.mainColorDark,
              fontSize: 12.0
            ),
          ),
        ),
        SizedBox(height: 16.0),
      ]
    );
  }

  String getDateTime(int timestamp) {
    return formatDate(
      DateTime.fromMillisecondsSinceEpoch(timestamp),
      [dd, ' ', M, ' ', yyyy, ' ', HH, ':', nn, am]
    );
  }
}