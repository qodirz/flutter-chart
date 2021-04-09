import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart/models/dataModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataController extends ChangeNotifier {
  List<DataModel> _realizations = [];
  List<DataModel> _plans = [];

  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
  ];

  List<String> _listPlace = [
    "Provinsi kalimantan utara",
    "Kabupaten Bulungan",
    "Kabupaten Nunukan",
    "Kabupaten Malinau",
    "Kabupaten Tana Tidung",
    "Kota Tarakan"
  ];

  DataController() {
    months.asMap().forEach((idx, month) {
      return _realizations.add(
        new DataModel(
          month: month,
          dataInGb: ((idx + 1) * 5).toDouble(),
          barColor: charts.ColorUtil.fromDartColor(Colors.blue),
        ),
      );
    });
    months.asMap().forEach((idx, month) {
      return _plans.add(
        new DataModel(
          month: month,
          dataInGb: ((idx + 1) * 3).toDouble(),
          barColor: charts.ColorUtil.fromDartColor(Colors.amber),
        ),
      );
    });
    notifyListeners();
  }

  List<DataModel> get realizations => _realizations;
  List<DataModel> get plans => _plans;
  List<String> get places => _listPlace;
}
