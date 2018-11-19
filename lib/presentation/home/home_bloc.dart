import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vehicle_search/network/api_manager.dart';
import 'package:vehicle_search/presentation/base/base_bloc.dart';
import 'package:vehicle_search/presentation/home/home_state.dart';

class HomeBloc extends BaseBloc {
  HomeBloc._(this.onVehiclesRequested, this.state) {
    reload();
  }

  final Sink onVehiclesRequested;

  final Stream<HomeState> state;

  void reload() {
    onVehiclesRequested.add(Object());
  }

  factory HomeBloc(ApiManager apiManager) {
    final onVehiclesRequested = BehaviorSubject();

    final state = onVehiclesRequested
        .switchMap<HomeState>((_) => _getVehicles(apiManager))
        .startWith(HomeEmpty());

    return HomeBloc._(onVehiclesRequested, state);
  }

  static Stream<HomeState> _getVehicles(ApiManager apiManager) async* {
    print("Get vehicle");
    yield HomeLoading();

    try {
      final result = await apiManager.getVehicles();
      if (result.results.isNotEmpty) {
        yield HomePopulated(
            UnmodifiableListView(result.results.toSet().toList()));
      } else {
        yield HomeEmpty();
      }
    } catch (e) {
      yield HomeError();
    }
  }

  void dispose() {
    super.dispose();
    onVehiclesRequested.close();
  }
}
