import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import '../datatypes/Property.dart';

/// Gets a list of the properties
@Injectable()
class PropertiesService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _propertiesUrl = '/api/v1/properties';
  final Client _http;

  /// Initializes the http connection
  PropertiesService(this._http);

  /// Gets the list of properties
  Future<List<Property>> properties() async {
    try {
      final resp = await _http.get(
        _propertiesUrl,
        headers: _headers);

      return new List.from(JSON.decode(resp.body))
        .map((p) => new Property.fromJson(p))
        .toList();
    } on Exception catch(e) {
      throw _handleError(e);
    }
  }
}

Exception _handleError(e) {
  print(e);
  return new Exception('Server error: $e');
}
