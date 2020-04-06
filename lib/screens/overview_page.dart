// Material
import 'package:covid_tracker/widgets/line-graph.dart';
import 'package:flutter/material.dart';

// Services
import 'package:covid_tracker/services/novel_covid.dart';

// Widgets
import 'package:covid_tracker/widgets/global_stats.dart';
import 'package:covid_tracker/widgets/loading_section.dart';

// Models
import 'package:covid_tracker/models/global_covid.dart';
import 'package:covid_tracker/models/historical_covid.dart';

// Colors
import 'package:covid_tracker/constants/colors.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  Future<GlobalCovid> futureGlobalStats;
  Future<HistoricalCovid> futureHistoricalStats;

  @override
  void initState() {
    super.initState();
    futureGlobalStats = fetchGlobalStats();
    futureHistoricalStats = fetchHistoricalStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: PurpleScheme.mainColor,
        title: Text(
          'Global Overview',
          style: TextStyle(
            color: Colors.white
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: FutureBuilder<GlobalCovid>(
                future: futureGlobalStats,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GlobalStats(stats: snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return LoadingSection(color: PurpleScheme.mainColor);
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: FutureBuilder<HistoricalCovid>(
                future: futureHistoricalStats,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          height: 150.0,
                          child: LineGraph(
                            title: 'Cases',
                            lineColor: 'blue',
                            data: snapshot.data.cases
                          )
                        ),
                        Container(
                          height: 150.0,
                          child: LineGraph(
                            title: 'Deaths',
                            lineColor: 'red',
                            data: snapshot.data.deaths
                          )
                        ),
                        Container(
                          height: 150.0,
                          child: LineGraph(
                            title: 'Recovered',
                            lineColor: 'green',
                            data: snapshot.data.recovered
                          )
                        ),
                      ]
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return LoadingSection(color: PurpleScheme.mainColor);
                },
              ),
            ),
          ],
        )
      )
    );
  }
}
