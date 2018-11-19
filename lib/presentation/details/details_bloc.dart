import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vehicle_search/network/api_manager.dart';
import 'package:vehicle_search/presentation/base/base_bloc.dart';
import 'package:vehicle_search/presentation/details/details_state.dart';

class DetailsBloc extends BaseBloc {
  DetailsBloc._(this.onDetailsRequested, this.state) {
    reload();
  }

  final Sink onDetailsRequested;

  final Stream<DetailsState> state;

  factory DetailsBloc(ApiManager apiManager, String manufacturer) {
    final onDetailsRequested = BehaviorSubject();

    final state = onDetailsRequested
        .switchMap((_) => _getManufacturerDetails(apiManager, manufacturer))
        .startWith(DetailsEmpty());

    return DetailsBloc._(onDetailsRequested, state);
  }

  static Stream<DetailsState> _getManufacturerDetails(
      ApiManager apiManager, String manufacturer) async* {
    yield DetailsLoading();

    try {
      final result = await apiManager.getManufacturerDetails(manufacturer);
      if (result.results.isNotEmpty) {
        yield DetailsPopulated(
            UnmodifiableListView(result.results.toSet().toList()));
      } else {
        yield DetailsEmpty();
      }
    } catch (e, stacktrace) {
      print(stacktrace);
      yield DetailsError(e);
    }
  }

  void reload() {
    onDetailsRequested.add(Object());
  }

  @override
  void dispose() {
    super.dispose();
    onDetailsRequested.close();
  }
}
