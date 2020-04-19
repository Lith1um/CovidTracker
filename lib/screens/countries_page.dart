// Material
import 'package:covid_tracker/screens/overview_page.dart';
import 'package:flutter/material.dart';

// Services
import 'package:covid_tracker/services/novel_covid.dart';

// Widgets
import 'package:covid_tracker/widgets/loading_section.dart';

// Models
import 'package:covid_tracker/models/global_covid.dart';

// Colors
import 'package:covid_tracker/constants/colors.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Future<List<GlobalCovid>> futureCountriesStats;
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    futureCountriesStats = fetchCountriesStats();
  }

  void onSearchTermChanged(String value) {
    setState(() => _searchTerm = value);
  }

  List<GlobalCovid> filterCountries(List<GlobalCovid> countries) {
    return countries.where((item) => item.country
      .toLowerCase()
      .contains(_searchTerm.toLowerCase()))
    .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: PurpleScheme.mainColor,
        title: Text(
          'Countries',
          style: TextStyle(
            color: Colors.white
          ),
        )
      ),
      body: FutureBuilder<List<GlobalCovid>>(
        future: futureCountriesStats,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<GlobalCovid> countries = filterCountries(snapshot.data);

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      icon: Icon(Icons.search),
                    ),
                    onChanged: onSearchTermChanged,
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: countries.length,
                    itemBuilder: (context, index) =>
                      ListTile(
                        title: Text(
                          countries[index].country,
                          style: TextStyle(
                            fontSize: 20.0
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => 
                            OverviewPage(country: countries[index].country))
                        )
                      ),
                    separatorBuilder: (context, index) =>
                      Divider()
                  ),
                )
              ]
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return LoadingSection(color: PurpleScheme.mainColor);
        },
      ),
    );
  }
}
