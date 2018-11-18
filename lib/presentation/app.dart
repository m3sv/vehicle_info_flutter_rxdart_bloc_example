import 'package:flutter/material.dart';
import 'package:vehicle_search/network/api_manager.dart';
import 'package:vehicle_search/presentation/home/home_page.dart';

class App extends StatelessWidget {
  final ApiManager apiManager;

  App({this.apiManager});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vehicles',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(
          title: 'Vehicles',
          apiManager: apiManager,
        ));
  }
}
