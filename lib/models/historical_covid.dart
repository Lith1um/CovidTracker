class HistoricalCovid {
  final Map<String, dynamic> cases;
  final Map<String, dynamic> deaths;
  final Map<String, dynamic> recovered;

  HistoricalCovid({this.cases, this.deaths, this.recovered});

  factory HistoricalCovid.fromJson(Map<String, dynamic> json) {
    return HistoricalCovid(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered']
    );
  }
}