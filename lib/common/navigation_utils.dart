import 'package:flutter/widgets.dart';

enum Screen { ALL, DETAILS }

class NavigationUtils {
  NavigationUtils._();

  static navigateTo(BuildContext context, Screen screen) {
    switch (screen) {
      case Screen.ALL:
        Navigator.of(context).pushReplacementNamed('/');
        break;

      case Screen.DETAILS:
        print("navigated to details");
        Navigator.of(context).pushNamed('/');
        break;
    }
  }
}
