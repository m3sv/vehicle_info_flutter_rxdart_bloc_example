import 'package:rxdart/rxdart.dart';
import 'package:vehicle_search/common/navigation_utils.dart';

abstract class BaseBloc {
  final _navigationSubject = PublishSubject<Screen>();

  Stream<Screen> get navigation => _navigationSubject;

  void navigateTo(Screen screen) {
    _navigationSubject.add(screen);
  }
}
