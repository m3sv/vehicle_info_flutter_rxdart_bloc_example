import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vehicle_search/network/api_manager.dart';
import 'package:vehicle_search/network/vehicle_manufacter.dart';

class HomeBloc {
  HomeBloc({this.apiManager}) {
    _initializeVehicles();
  }

  final ApiManager apiManager;

  final _vehiclesSubject =
      BehaviorSubject<UnmodifiableListView<VehicleManufacturer>>();

  List<VehicleManufacturer> _vehicleManufacturers = [];

  Stream<List<VehicleManufacturer>> get vehicleManufacturers =>
      _vehiclesSubject.stream;

  Future<VehicleResponse> _getVehicles() async {
    return apiManager.getVehicles();
  }

  Future<Null> _updateVehicleManufacturers() async {
    final vehicles = await _getVehicles();
    _vehicleManufacturers = vehicles.results;
  }

  Future<void> _initializeVehicles() async {
    await _updateVehicleManufacturers();
    _vehiclesSubject.add(UnmodifiableListView(_vehicleManufacturers.toSet().toList()));
  }
}
