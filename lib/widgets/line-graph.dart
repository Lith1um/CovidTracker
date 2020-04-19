// Libs
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineGraph extends StatelessWidget {
  final String title;
  final String lineColor;
  final Map<String, dynamic> data;

  const LineGraph({this.data, this.lineColor, this.title});
  
  @override
  Widget build(BuildContext context) {

    List<TimeSeriesData> chartData = createChartData(data);

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0
            )
          ),
          Container(
            height: 160.0,
            child: charts.TimeSeriesChart(
              [charts.Series<TimeSeriesData, DateTime>(
                  id: 'LineGraph',
                  colorFn: (_, __) => getLineColor(lineColor),
                  displayName: title,
                  domainFn: (TimeSeriesData data, _) => data.dateTime,
                  measureFn: (TimeSeriesData data, _) => data.count,
                  data: chartData,
              )],
              animate: false,
              domainAxis: new charts.EndPointsTimeAxisSpec(),
            )
          )
        ]
      )
    );
  }
}

charts.Color getLineColor(String color) {
  Map<String, charts.Color> lineColors = {
    'blue': charts.MaterialPalette.blue.shadeDefault,
    'green': charts.MaterialPalette.green.shadeDefault,
    'red': charts.MaterialPalette.red.shadeDefault
  };

  return lineColors[color];
}

List<TimeSeriesData> createChartData(Map<String, dynamic> data) {
  List<TimeSeriesData> chartData = [];

  data.forEach((String date, dynamic count) {
    List<String> dateSplit = date.split('/');
    chartData.add(TimeSeriesData(new DateTime(
      int.parse("20${dateSplit[2]}"),
      int.parse(dateSplit[0]),
      int.parse(dateSplit[1])
    ), count.toInt()));
  });

  return chartData;
}

class TimeSeriesData {
  final DateTime dateTime;
  final int count;

  TimeSeriesData(this.dateTime, this.count);
}
