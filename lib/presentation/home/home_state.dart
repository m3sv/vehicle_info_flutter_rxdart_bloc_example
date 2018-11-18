import 'package:vehicle_search/network/vehicle_response.dart';

class HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}

class HomePopulated extends HomeState {
  final List<VehicleManufacturer> result;

  HomePopulated(this.result);
}

class HomeEmpty extends HomeState {}
