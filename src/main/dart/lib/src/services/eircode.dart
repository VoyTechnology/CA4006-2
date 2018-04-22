import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import '../datatypes/Address.dart';

/// Resolves eircodes to address and coordinates
@Injectable()
class EircodeService {
  static final _headers = {'Content-Type': "application/json"};
  static final _mapsApiUrl = "https://maps.googleapis.com/maps/api/geocode/json?address";
  final Client _http;

  /// Initializes the http connection
  EircodeService(this._http);

  /// Address returns the address corresponding to the Eircode
  Future<Address> address(String eircode) async {
    try {
      print("$_mapsApiUrl=$eircode,IRELAND");

      final resp = await _http.get(
        "$_mapsApiUrl=$eircode,IRELAND",
        headers: _headers,
      );

      print(JSON.decode(resp.body));

      // final data = new List.from(_data['results']).first;

      // final data = null;

      // if (data == null) {
      //   return new Address(
      //     eircode: eircode,
      //     address: "Not found",
      //   );
      // }

      return new Address(
        eircode: eircode,
        address: 'Some address',
      );

      // return new Address(
      //   eircode: eircode,
      //   address: data['formatted_address'],
      //   lattitude: data['geometry']['location']['lat'],
      //   longitude: data['geometry']['location']['lng'],
      // );
    } on Exception catch (e) {
      throw _handleError(e);
    } 
  }
}

Exception _handleError(e) {
  print(e);
  return new Exception('Server error: $e');
}
