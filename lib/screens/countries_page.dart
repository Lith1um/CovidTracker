// Material
import 'package:flutter/material.dart';

// Colors
import 'package:covid_tracker/constants/colors.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: mainColor2,
        title: Text(
          'Countries',
          style: TextStyle(
            color: Colors.white
          ),
        )
      ),
      body: Container()
    );
  }
}
