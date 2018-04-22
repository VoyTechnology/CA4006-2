import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'src/datatypes/Property.dart';

/// Testing mock server
@Injectable()
class InMemoryDataService extends MockClient {
  static final _headers = {'Content-Type': 'application/json'};

  /// Initial list of available properties
  static final _initialProperties = <Property>[
    new Property(
      url: "/#/property/1",
      id: 1,
      eircode: 'D09FW22',
      postedTimestamp: new DateTime(2018, DateTime.APRIL, 21, 17, 0, 0),
      auctionCloseTimestamp: new DateTime(2017, DateTime.APRIL, 22, 17, 0, 0),
      description: 'The Helix is a __modern__ building in *DCU*',
      askingPrice: 102314,
      bedrooms: 1,
      bathrooms: 20,
      hasGarage: false,
      selfSustainable: false,
      petsAllowed: true,
    ),
  ];
  static List<Property> _propertiesDB;

  /// Constructor
  InMemoryDataService() : super(_handler);

  static Future<Response> _handler(Request req) async {
    if(_propertiesDB == null) {
      _resetDB();
    }

    final splitURL = req.url.pathSegments;

    switch(splitURL[2]) {
      case 'properties':
        return _handleProperties(req);
      case 'property':
        return _handleProperty(req);
    }

    return _handleProperties(req);

    // return new Response(JSON.encode({"data":"hello"}), 200, headers: _headers);
  }

  static Future<Response> _handleProperties(Request req) async {
    if (req.method == 'GET') {
      return new Response(JSON.encode(_propertiesDB), 200, headers: _headers);
    }
    
    return new Response(JSON.encode('{"error":"only GET is accepted"}'), 405);
  }

  static Future<Response> _handleProperty(Request req) async {
    if (req.method == 'GET') {
      final id = int.parse(req.url.pathSegments[3], onError: (_) => 0);
      return new Response(JSON.encode(_propertiesDB[id-1]), 200, headers: _headers);
    }

    return new Response(JSON.encode('{"error":"unknown method"}'), 405);
  }

  static void _resetDB() {
    _propertiesDB = _initialProperties;
  }
}