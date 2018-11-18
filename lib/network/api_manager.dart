import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehicle_search/network/manufacturer_details_response.dart';
import 'package:vehicle_search/network/vehicle_response.dart';

class ApiManager {
  Future<VehicleResponse> getVehicles() async {
    final response = await http.get(
        "https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json");

    print("Response: $response");
    if (response.statusCode == 200) {
      return VehicleResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load vehicles");
    }
  }

  Future<ManufacturerDetailsResponse> getManufacturerDetails(
      String manufacturerName) async {
    final response = await http.get(
        "https://vpic.nhtsa.dot.gov/api/vehicles/getmanufacturerdetails/$manufacturerName?format=json");

    print("Response: $response");
    if (response.statusCode == 200) {
      return ManufacturerDetailsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load vehicles");
    }
  }
}
