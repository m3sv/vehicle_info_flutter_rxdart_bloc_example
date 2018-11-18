import 'package:flutter/material.dart';
import 'package:vehicle_search/presentation/home/home_bloc.dart';
import 'package:vehicle_search/presentation/home/home_page.dart';

class App extends StatelessWidget {
  final HomeBloc homeBloc;

  App({this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicles',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Vehicles',
        bloc: homeBloc,
      ),
    );
  }
}
