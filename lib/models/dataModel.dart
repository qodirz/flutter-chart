import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class DataModel {
  final String month;
  final double dataInGb;
  final charts.Color barColor;

  DataModel(
      {@required this.month, @required this.dataInGb, @required this.barColor});
}
