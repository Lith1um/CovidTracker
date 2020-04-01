// Material
import 'package:flutter/material.dart';

// Screens
import 'package:covid_tracker/screens/overview_page.dart';
import 'package:covid_tracker/screens/countries_page.dart';

// Widgets
import 'package:covid_tracker/widgets/tile.dart';

// Consts
import 'package:covid_tracker/constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Tracking COVID - 19',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: 30.0),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Tile(
                      title: 'Overview',
                      summary: 'View whole world statistics',
                      icon: Icons.language,
                      pageToLoad: OverviewPage(),
                    ),
                    SizedBox(width: 16.0),
                    Tile(
                      title: 'Countries',
                      summary: 'View statistics for indiviual countries',
                      icon: Icons.assessment,
                      pageToLoad: CountriesPage(),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
