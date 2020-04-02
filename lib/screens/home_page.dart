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
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: PurpleScheme.mainColorAccent,
        title: Text(
          'COVID-19',
          style: TextStyle(
            color: PurpleScheme.mainColorDark,
            fontSize: 24.0,
            fontWeight: FontWeight.bold
          ),
        )
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: PurpleScheme.mainColorAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40.0),
                Text(
                  'Daily updates on the spread of the coronavirus throughout the world, as well as preventative measures and how you can help do your part to slow the spread',
                  style: TextStyle(
                    color: PurpleScheme.mainColorDark,
                    fontSize: 14.0
                  )
                ),
                SizedBox(height: 20.0),
              ]
            )
          ),
          Image.asset('assets/images/globe.jpg'),
          SizedBox(height: 20.0),
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.all(16.0),
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
            )
          )
        ],
      ),
    );
  }
}
