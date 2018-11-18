import 'package:flutter/material.dart';
import 'package:vehicle_search/network/api_manager.dart';
import 'package:vehicle_search/presentation/app.dart';

void main() {
  final apiManager = ApiManager();
  runApp(App(
    apiManager: apiManager,
  ));
}
