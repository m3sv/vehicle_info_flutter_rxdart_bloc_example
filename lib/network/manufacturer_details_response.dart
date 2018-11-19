class ManufacturerDetailsResponse {
  int count;
  String message;
  String searchCriteria;
  List<ManufacturerDetails> results;

  ManufacturerDetailsResponse({this.count, this.message, this.searchCriteria, this.results});

  ManufacturerDetailsResponse.fromJson(Map<String, dynamic> json) {
    count = json['Count'];
    message = json['Message'];
    searchCriteria = json['SearchCriteria'];
    if (json['Results'] != null) {
      results = new List<ManufacturerDetails>();
      json['Results'].forEach((v) {
        results.add(new ManufacturerDetails.fromJson(v));
      });
    }
  }
}

class ManufacturerDetails {
  String address;
  String address2;
  String city;
  String contactEmail;
  String contactFax;
  String contactPhone;
  String country;
  String dBAs;
  List<Object> equipmentItems;
  String lastUpdated;
  List<ManufacturerTypes> manufacturerTypes;
  String mfrCommonName;
  int mfrID;
  String mfrName;
  String otherManufacturerDetails;
  String postalCode;
  String primaryProduct;
  String principalFirstName;
  String principalLastName;
  String principalPosition;
  String stateProvince;
  String submittedName;
  String submittedOn;
  String submittedPosition;
  List<VehicleTypes> vehicleTypes;

  ManufacturerDetails(
      {this.address,
      this.address2,
      this.city,
      this.contactEmail,
      this.contactFax,
      this.contactPhone,
      this.country,
      this.dBAs,
      this.equipmentItems,
      this.lastUpdated,
      this.manufacturerTypes,
      this.mfrCommonName,
      this.mfrID,
      this.mfrName,
      this.otherManufacturerDetails,
      this.postalCode,
      this.primaryProduct,
      this.principalFirstName,
      this.principalLastName,
      this.principalPosition,
      this.stateProvince,
      this.submittedName,
      this.submittedOn,
      this.submittedPosition,
      this.vehicleTypes});

  ManufacturerDetails.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    address2 = json['Address2'];
    city = json['City'];
    contactEmail = json['ContactEmail'];
    contactFax = json['ContactFax'];
    contactPhone = json['ContactPhone'];
    country = json['Country'];
    dBAs = json['DBAs'];
    if (json['EquipmentItems'] != null) {
      equipmentItems = new List();
      json['EquipmentItems'].forEach((v) {
        equipmentItems.add(v);
      });
    }
    lastUpdated = json['LastUpdated'];
    if (json['ManufacturerTypes'] != null) {
      manufacturerTypes = new List<ManufacturerTypes>();
      json['ManufacturerTypes'].forEach((v) {
        manufacturerTypes.add(new ManufacturerTypes.fromJson(v));
      });
    }
    mfrCommonName = json['Mfr_CommonName'];
    mfrID = json['Mfr_ID'];
    mfrName = json['Mfr_Name'];
    otherManufacturerDetails = json['OtherManufacturerDetails'];
    postalCode = json['PostalCode'];
    primaryProduct = json['PrimaryProduct'];
    principalFirstName = json['PrincipalFirstName'];
    principalLastName = json['PrincipalLastName'];
    principalPosition = json['PrincipalPosition'];
    stateProvince = json['StateProvince'];
    submittedName = json['SubmittedName'];
    submittedOn = json['SubmittedOn'];
    submittedPosition = json['SubmittedPosition'];
    if (json['VehicleTypes'] != null) {
      vehicleTypes = new List<VehicleTypes>();
      json['VehicleTypes'].forEach((v) {
        vehicleTypes.add(new VehicleTypes.fromJson(v));
      });
    }
  }
}

class ManufacturerTypes {
  String name;

  ManufacturerTypes({this.name});

  ManufacturerTypes.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    return data;
  }
}

class VehicleTypes {
  String gVWRFrom;
  String gVWRTo;
  bool isPrimary;
  String name;

  VehicleTypes({this.gVWRFrom, this.gVWRTo, this.isPrimary, this.name});

  VehicleTypes.fromJson(Map<String, dynamic> json) {
    gVWRFrom = json['GVWRFrom'];
    gVWRTo = json['GVWRTo'];
    isPrimary = json['IsPrimary'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GVWRFrom'] = this.gVWRFrom;
    data['GVWRTo'] = this.gVWRTo;
    data['IsPrimary'] = this.isPrimary;
    data['Name'] = this.name;
    return data;
  }
}
