import 'package:flutter/material.dart';
import 'package:flutter_chart/controllers/data_controller.dart';
import 'package:flutter_chart/widgets/bar_chart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataController dataController = Provider.of<DataController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: Text("Bar Chart"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: DataChart(
          data: dataController.chartData,
        ),
      ),
    );
  }
}
