import 'package:flutter/material.dart';
import 'package:vehicle_search/network/api_manager.dart';
import 'package:vehicle_search/presentation/app.dart';
import 'package:vehicle_search/presentation/home/home_bloc.dart';

void main() {
  final apiManager = ApiManager();
  final homeBloc = HomeBloc(apiManager: apiManager);
  runApp(App(
    homeBloc: homeBloc,
  ));
}
