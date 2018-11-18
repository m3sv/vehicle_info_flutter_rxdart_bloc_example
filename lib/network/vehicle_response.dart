class VehicleResponse {
  int count;
  String message;
  String searchCriteria;
  List<VehicleManufacturer> results;

  VehicleResponse({this.count, this.message, this.searchCriteria, this.results});

  factory VehicleResponse.fromJson(Map<String, dynamic> json) {
    List<VehicleManufacturer> results;

    if (json['Results'] != null) {
      results = [];
      json['Results'].forEach((v) {
        results.add(new VehicleManufacturer.fromJson(v));
      });
    } else {
      results = [];
    }

    return VehicleResponse(
      count: json['Count'],
      message: json['Message'],
      searchCriteria: json['SearchCriteria'],
      results: results,
    );
  }
}

class VehicleManufacturer {
  String country;
  String commonName;
  int id;
  String fullName;
  List<VehicleTypes> vehicleTypes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is VehicleManufacturer &&
              runtimeType == other.runtimeType &&
              country == other.country &&
              commonName == other.commonName &&
              id == other.id &&
              fullName == other.fullName;

  @override
  int get hashCode =>
      country.hashCode ^
      commonName.hashCode ^
      id.hashCode ^
      fullName.hashCode;

  VehicleManufacturer(
      {this.country,
      this.commonName,
      this.id,
      this.fullName,
      this.vehicleTypes});

  VehicleManufacturer.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    commonName = json['Mfr_CommonName'];
    id = json['Mfr_ID'];
    fullName = json['Mfr_Name'];
    if (json['VehicleTypes'] != null) {
      vehicleTypes = new List<VehicleTypes>();
      json['VehicleTypes'].forEach((v) {
        vehicleTypes.add(new VehicleTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = this.country;
    data['Mfr_CommonName'] = this.commonName;
    data['Mfr_ID'] = this.id;
    data['Mfr_Name'] = this.fullName;
    if (this.vehicleTypes != null) {
      data['VehicleTypes'] = this.vehicleTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleTypes {
  bool isPrimary;
  String name;

  VehicleTypes({this.isPrimary, this.name});

  VehicleTypes.fromJson(Map<String, dynamic> json) {
    isPrimary = json['IsPrimary'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsPrimary'] = this.isPrimary;
    data['Name'] = this.name;
    return data;
  }
}
