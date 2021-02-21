import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart/models/dataModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataController extends ChangeNotifier {
  List<DataModel> _data = [];

  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];

  DataController() {
    months.asMap().forEach((idx, month) {
      return _data.add(
        new DataModel(
          month: month,
          dataInGb: ((idx + 1) * 5).toDouble(),
          barColor: charts.ColorUtil.fromDartColor(Colors.blue),
        ),
      );
    });
    notifyListeners();
  }

  List<DataModel> get chartData => _data;
}
