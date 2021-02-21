import 'package:flutter_chart/models/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataChart extends StatelessWidget {
  final List<DataModel> data;

  const DataChart({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataModel, String>> series = [
      charts.Series(
          data: data,
          id: "BarChart",
          domainFn: (DataModel series, _) => series.month,
          measureFn: (DataModel series, _) => series.dataInGb,
          colorFn: (DataModel series, _) => series.barColor),
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
