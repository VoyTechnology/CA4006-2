/// Property contains the data which can be used to display the propety
class Property {
  /// ID of the property
  int id;
  /// Eircode address
  String eircode;
  /// Human-readable address of the property generated from eircode
  String address;
  /// Description of the property. This can be either plain text, markdown or
  /// escaped HTML.
  String description;
  /// Type of property, 1 is apartment, 2 is house
  int propertyType;
  /// Price that the user is asking for
  int askingPrice;
  /// Number of bedrooms in the property
  int bedrooms;
  /// number of bathrooms in the property
  int bathrooms;
  /// Square meters of the area
  int area;
  /// Does the property contain a garage
  bool garage;
  /// Does the property have a parking spot
  bool parking;
  /// Equiped with an alarm
  bool alarm;
  /// Pets are allowed;
  bool petsAllowed;
  /// Is the building self sustainable
  bool selfSustainable;
  /// Time when the auction is going to be closed
  DateTime auctionCloseTimestamp;
  /// Time when the property was posted
  DateTime postedTimestamp;
  /// viewing times of the property
  String viewingTimes;


  /// Internal fields
  /// 
  /// Token used in case of requests.
  String token;
  /// Time remaining

  /// Login request
  Property({
    this.id,
    this.eircode,
    this.address,
    this.description,
    this.propertyType,
    this.askingPrice = 0,
    this.bedrooms,
    this.bathrooms,
    this.area,
    this.garage,
    this.parking,
    this.alarm,
    this.petsAllowed,
    this.selfSustainable,
    this.auctionCloseTimestamp,
    this.postedTimestamp,
    this.viewingTimes,
  });

  /// creates a new login request from map
  factory Property.fromJson(Map<String, dynamic> json) => new Property(
    id: json['id'],
    eircode: json['eircode'],
    address: json['address'],
    description: json['description'],
    propertyType: json['property_type'],
    askingPrice: json['asking_price'],
    bedrooms: json['bedrooms'],
    bathrooms: json['bathrooms'],
    area: json['area'],
    garage: json['garage'],
    parking: json['parking'],
    alarm: json['alarm'],
    petsAllowed: json['pets_allowed'],
    selfSustainable: json['self_sustainable'],
    auctionCloseTimestamp: new DateTime.fromMillisecondsSinceEpoch(
      json['auction_close_timestamp'] * 1000),
    postedTimestamp: new DateTime.fromMillisecondsSinceEpoch(
      json['posted_timestamp'] * 1000),
    viewingTimes: json['viewing_times'],
  );

  /// maps to json
  Map<String, dynamic> toJson() => {
    'id':id,
    'eircode': eircode,
    'address': address,
    'description': description,
    'property_type': propertyType,
    'asking_price': askingPrice,
    'bedrooms': bedrooms,
    'bathrooms': bathrooms,
    'area': area,
    'garage': garage,
    'parking': parking,
    'alarm': alarm,
    'pets_allowed': petsAllowed,
    'self_sustainable': selfSustainable,
    'posted_timestamp': postedTimestamp.millisecondsSinceEpoch ~/ 1000,
    'auction_close_timestamp': auctionCloseTimestamp.millisecondsSinceEpoch ~/ 1000,
    'viewing_times': viewingTimes.toString(),
  };
}