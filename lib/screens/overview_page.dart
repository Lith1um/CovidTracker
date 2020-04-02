// Material
import 'package:flutter/material.dart';

// Services
import 'package:covid_tracker/services/novel_covid.dart';

// Widgets
import 'package:covid_tracker/widgets/global_stats.dart';
import 'package:covid_tracker/widgets/loading_section.dart';

// Models
import 'package:covid_tracker/models/global_covid.dart';

// Colors
import 'package:covid_tracker/constants/colors.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  Future<GlobalCovid> futureGlobalStats;

  @override
  void initState() {
    super.initState();
    futureGlobalStats = fetchGlobalStats();
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
      body: Container(
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
      )
    );
  }
}
