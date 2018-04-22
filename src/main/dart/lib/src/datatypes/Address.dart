/// Address contains the information about a specific address.
class Address {
  /// Eircode
  String eircode;
  /// Formatted, user friendly address
  String address;
  /// Lattitude
  double lattitude;
  /// Longitude
  double longitude;

  /// Address constructor
  Address({this.eircode, this.address, this.lattitude, this.longitude});

  /// Creates an address from JSON
  factory Address.fromJson(Map<String, dynamic> json) => new Address(
    eircode: json['eircode'],
    address: json['address'],
    lattitude: json['lattitude'],
    longitude: json['longitude'],
  );
}