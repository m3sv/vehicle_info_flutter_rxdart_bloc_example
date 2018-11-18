import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vehicle_search/common/injector.dart';
import 'package:vehicle_search/presentation/details/details_page.dart';
import 'package:vehicle_search/presentation/home/home_page.dart';

class Screen {
  final Object data;

  Screen({this.data});
}

class All extends Screen {
  All({Object data}) : super(data: data);
}

class Details extends Screen {
  Details({Object data}) : super(data: data);
}

class NavigationUtils {
  NavigationUtils._();

  static navigateTo(BuildContext context, Screen screen) {
    print("Navigate to: $screen");
    if (screen is All) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    title: 'Vehicles',
                    apiManager: Injector.getApiManager(),
                    data: screen.data,
                  )));
      return;
    }

    if (screen is Details) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPage(
                    title: screen.data,
                    apiManager: Injector.getApiManager(),
                    data: screen.data,
                  )));
      return;
    }
  }
}
