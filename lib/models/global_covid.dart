class GlobalCovid {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int updated;

  GlobalCovid({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.updated
  });

  factory GlobalCovid.fromJson(Map<String, dynamic> json) {
    return GlobalCovid(
      country: json['country'] ?? 'Global',
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      active: json['active'],
      updated: json['updated'],
    );
  }
}
