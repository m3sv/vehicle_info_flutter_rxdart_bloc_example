import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vehicle_search/network/api_manager.dart';
import 'package:vehicle_search/network/vehicle_response.dart';
import 'package:vehicle_search/presentation/base/base_bloc.dart';
import 'package:vehicle_search/presentation/home/home_state.dart';

class HomeBloc extends BaseBloc {
  HomeBloc(this.apiManager) {
    _initializeVehicles();
  }

  final ApiManager apiManager;

  final _vehiclesSubject = BehaviorSubject<HomeState>();

  List<VehicleManufacturer> _vehicleManufacturers = [];

//  UnmodifiableListView<VehicleManufacturer>
//  List<VehicleManufacturer>
  Stream<HomeState> get vehicleManufacturers => _vehiclesSubject.stream;

  Future<VehicleResponse> _getVehicles() async {
    return apiManager.getVehicles();
  }

  Future<Null> _updateVehicleManufacturers() async {
    final vehicles = await _getVehicles();
    _vehicleManufacturers = vehicles.results;
  }

  Future<void> _initializeVehicles() async {
    await _updateVehicleManufacturers();
    _vehiclesSubject.add(HomePopulated(
        UnmodifiableListView(_vehicleManufacturers.toSet().toList())));
  }
}


