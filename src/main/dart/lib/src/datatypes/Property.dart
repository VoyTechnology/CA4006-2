/// Property contains the data which can be used to display the propety
class Property {
  /// URL address to view the property
  String url;
  /// ID of the property
  int id;
  /// Eircode address
  String eircode;
  /// Price that the user is asking for
  int askingPrice;
  /// Time when the property was posted
  DateTime postedTimestamp;
  /// Time when the auction is going to be closed
  DateTime auctionCloseTimestamp;
  /// Description of the property. This can be either plain text, markdown or
  /// escaped HTML.
  String description;
  /// Number of bedrooms in the property
  int bedrooms;
  /// number of bathrooms in the property
  int bathrooms;
  /// Square meters of the area
  int area;
  /// Does the property contain a garage
  bool hasGarage;
  /// Is the building self sustainable
  bool selfSustainable;
  /// Pets are allowed;
  bool petsAllowed;

  /// Login request
  Property({this.url, this.id, this.eircode, this.askingPrice,
    this.postedTimestamp, this.auctionCloseTimestamp, this.description,
    this.bedrooms, this.bathrooms, this.area, this.hasGarage,
    this.selfSustainable, this.petsAllowed});

  /// creates a new login request from map
  factory Property.fromJson(Map<String, dynamic> json) => new Property(
    url: json['url'],
    id: json['id'],
    eircode: json['eircode'],
    askingPrice: json['asking_price'],
    postedTimestamp: new DateTime.fromMillisecondsSinceEpoch(
      json['posted_timestamp']),
    auctionCloseTimestamp: new DateTime.fromMillisecondsSinceEpoch(
      json['auction_close_timestamp']),
    description: json['description'],
    bedrooms: json['bedrooms'],
    bathrooms: json['bathrooms'],
    area: json['area'],
    hasGarage: json['has_garage'],
    selfSustainable: json['self_sustainable'],
    petsAllowed: json['pets_allowed'],
  );

  /// maps to json
  Map<String, dynamic> toJson() => {
    'url': url,
    'id':id,
    'eircode': eircode,
    'askingPrice': askingPrice,
    'posted_timestamp': postedTimestamp.millisecondsSinceEpoch,
    'auction_close_timestamp': auctionCloseTimestamp.microsecondsSinceEpoch,
    'description': description,
    'bedrooms': bedrooms,
    'bathrooms': bathrooms,
    'area': area,
    'has_garage': hasGarage,
    'self_sustainable': selfSustainable,
    'pets_allowed': petsAllowed,
  };
}