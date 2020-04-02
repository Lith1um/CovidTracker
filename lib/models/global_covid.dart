class GlobalCovid {
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int affectedCountries;
  final int updated;

  GlobalCovid({this.cases, this.deaths, this.recovered, this.active, this.affectedCountries, this.updated});

  factory GlobalCovid.fromJson(Map<String, dynamic> json) {
    return GlobalCovid(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
      affectedCountries: json['affectedCountries'],
      updated: json['updated'],
    );
  }
}
