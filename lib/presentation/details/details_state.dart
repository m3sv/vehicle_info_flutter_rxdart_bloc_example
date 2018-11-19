import 'package:vehicle_search/network/manufacturer_details_response.dart';

class DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsError extends DetailsState {
  final dynamic e;

  DetailsError(this.e);
}

class DetailsPopulated extends DetailsState {
  final List<ManufacturerDetails> data;

  DetailsPopulated(this.data);
}

class DetailsEmpty extends DetailsState {}
