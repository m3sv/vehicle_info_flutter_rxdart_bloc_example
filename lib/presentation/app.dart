import 'package:flutter/material.dart';
import 'package:vehicle_search/presentation/home/home_page.dart';

class App extends StatelessWidget {
  App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vehicles',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(
          title: 'Vehicles',
        ));
  }
}
