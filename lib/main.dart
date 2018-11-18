import 'package:flutter/material.dart';
import 'package:vehicle_search/common/injector.dart';
import 'package:vehicle_search/presentation/app.dart';

void main() {
  runApp(App(
    apiManager: Injector.getApiManager(),
  ));
}
