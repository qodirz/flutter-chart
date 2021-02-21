import 'package:flutter/material.dart';
import 'package:flutter_chart/controllers/data_controller.dart';
import 'package:provider/provider.dart';
import 'views/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataController()),
      ],
      child: MaterialApp(
        title: 'Sample Chart',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: HomePage(),
      ),
    );
  }
}
