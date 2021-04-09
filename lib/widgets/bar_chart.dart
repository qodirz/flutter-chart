import 'package:flutter_chart/models/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatelessWidget {
  final List<DataModel> realizations;
  final List<DataModel> plans;

  const BarChart({Key key, this.realizations, this.plans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataModel, String>> series = [
      charts.Series(
          data: realizations,
          id: "realizations",
          domainFn: (DataModel series, _) => series.month,
          measureFn: (DataModel series, _) => series.dataInGb,
          colorFn: (DataModel series, _) => series.barColor),
      charts.Series(
          data: plans,
          id: "plans",
          domainFn: (DataModel series, _) => series.month,
          measureFn: (DataModel series, _) => series.dataInGb,
          colorFn: (DataModel series, _) => series.barColor),
    ];

    return charts.BarChart(
      series,
      animate: true,
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(labelRotation: 40),
      ),
    );
  }
}
