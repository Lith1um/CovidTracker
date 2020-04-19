// Flutter
import 'dart:convert';
import 'package:http/http.dart' as http;

// Models
import 'package:covid_tracker/models/global_covid.dart';
import 'package:covid_tracker/models/historical_covid.dart';

Future<GlobalCovid> fetchGlobalStats([String country = 'all']) async {
  http.Response response;

  if (country == 'all') {
    response = await http.get('https://corona.lmao.ninja/v2/all');
  } else {
    response = await http.get('https://corona.lmao.ninja/v2/countries/$country');
  }

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

Future<HistoricalCovid> fetchHistoricalStats([String country = 'all']) async {
  final response = await http.get('https://corona.lmao.ninja/v2/historical/$country?lastdays=all');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> timeline = country == 'all' ?
      json.decode(response.body) : json.decode(response.body)['timeline'];

    return HistoricalCovid.fromJson(timeline);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load historical stats');
  }
}

Future<List<GlobalCovid>> fetchCountriesStats() async {
  final response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<GlobalCovid> countries = [];

    for (var country in json.decode(response.body)) {
      countries.add(GlobalCovid.fromJson(country));
    }
    return countries;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load historical stats');
  }
}
