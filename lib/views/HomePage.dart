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
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              _filterModal(context, dataController.places);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: BarChart(
          realizations: dataController.realizations,
          plans: dataController.plans,
        ),
      ),
    );
  }

  void _filterModal(context, places) {
    showModalBottomSheet(
        backgroundColor: Colors.cyan[200],
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _selectField("Provinsi", places),
                      _selectField("Periode", places),
                      _selectField("Tahun", places),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _selectField(title, listPlace) {
    String placeOption = listPlace[0];
    return Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.green[100], width: 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(title),
            ),
            Container(
              child: DropdownButton<String>(
                value: placeOption,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.black),
                underline: Container(
                  color: Colors.white,
                ),
                onChanged: (String newValue) {
                  print(newValue);
                },
                selectedItemBuilder: (BuildContext context) {
                  return listPlace.map<Widget>((String item) {
                    return SizedBox(
                      width: 180,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(item),
                      ),
                    );
                  }).toList();
                },
                items: listPlace.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }
}
