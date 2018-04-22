import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import '../datatypes/Property.dart';

/// Gets the property details
@Injectable()
class PropertyService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _propertyUrl = '/api/v1/property';
  final Client _http;

  /// Initializes the http connection
  PropertyService(this._http);

  /// Gets a single property information
  Future<Property> property(int id) async {
    try {
      final resp = await _http.get(
        "$_propertyUrl/$id",
        headers: _headers,
      );

      return new Property.fromJson(JSON.decode(resp.body));
    } on Exception catch(e) {
      throw _handleError(e);
    }
  }

  /// crates a new request
  Future<Null> create(Property property) async {
    try {
      await _http.post(
        "$_propertyUrl/new",
        headers: _headers,
        body: JSON.encode(property.toJson()),
      );

      return;
    } on Exception catch(_) {
      return;
    }
  }
}

Exception _handleError(e) {
  print(e);
  return new Exception('Server error: $e');
}