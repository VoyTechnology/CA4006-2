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
      id: 1,
      eircode: 'D09FW22',
      address: 'The Helix, DCU',
      description: 'The Helix is a __modern__ building in *DCU*',
      askingPrice: 35000000,
      bedrooms: 1,
      bathrooms: 20,
      garage: true,
      parking: true,
      alarm: true,
      petsAllowed: true,
      selfSustainable: true,
      auctionCloseTimestamp: new DateTime(2018, DateTime.APRIL, 22, 17, 0, 0),
      postedTimestamp: new DateTime(2018, DateTime.APRIL, 21, 17, 0, 0),
      viewingTimes: '540-1080',
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
      case 'login':
        return _handleLogin(req);
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

  static Future<Response> _handleLogin(Request req) async {
    if (req.method == 'POST') {
      return new Response(JSON.encode({'token': 'abc123'}), 200, headers: _headers);
    }

    return new Response(JSON.encode({'error': "unknown method"}), 405);
  }

  static void _resetDB() {
    _propertiesDB = _initialProperties;
  }
}