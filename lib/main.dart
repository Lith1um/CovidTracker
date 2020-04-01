// Material
import 'package:flutter/material.dart';

// Libs
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

// Screens
import 'package:covid_tracker/screens/home_page.dart';

// Consts
import 'package:covid_tracker/constants/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
    ));
    return MaterialApp(
      title: 'Covid Tracker',
      theme: ThemeData(
        primaryColor: mainColor,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}