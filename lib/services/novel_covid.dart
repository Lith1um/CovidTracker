// Flutter
import 'dart:convert';
import 'package:http/http.dart' as http;

// Models
import 'package:covid_tracker/models/global_covid.dart';

Future<GlobalCovid> fetchGlobalStats() async {
  final response = await http.get('https://corona.lmao.ninja/all');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GlobalCovid.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load global stats');
  }
}
