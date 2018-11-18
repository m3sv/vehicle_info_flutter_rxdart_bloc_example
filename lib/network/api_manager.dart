import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehicle_search/network/vehicle_manufacter.dart';

class ApiManager {
  Future<VehicleResponse> getVehicles() async {
    final response = await http.get(
        "https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json");

    print("Response: $response");
    if (response.statusCode == 200) {
      return VehicleResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load vehicles');
    }
  }
}
