import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import '../datatypes/Login.dart';

/// LoginService allows the user to login to the server
@Injectable()
class LoginService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _loginUrl = "/api/v1/login";
  final Client _http;

  /// Constructor which also initializes the http connection
  LoginService(this._http);

  /// login sends a request to the server to log in. 
  Future<LoginResponse> login(LoginRequest req) async {
    try {
      final resp = await _http.post(
        _loginUrl,
        headers: _headers,
        body: JSON.encode(req));
      return new LoginResponse.fromJson(JSON.decode(resp.body));
    } on Exception catch(e) {
      throw _handleError(e);
    }
  }
}

Exception _handleError(e) {
  print(e);
  return new Exception('Server error: $e');
}