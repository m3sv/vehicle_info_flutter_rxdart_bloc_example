import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:vehicle_search/common/navigation_utils.dart';
import 'package:vehicle_search/presentation/base/base_bloc.dart';

abstract class NavigationState<T extends StatefulWidget, B extends BaseBloc>
    extends State<T> {
  B bloc;

  @override
  void initState() {
    super.initState();
    assert(bloc != null, "BLoC is not instantiated");
    bloc.navigation
        .listen((screen) => NavigationUtils.navigateTo(context, screen));
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
