import 'dart:async';
import 'dart:convert';
import 'dart:html' show window;

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import '../datatypes/Login.dart';

/// LoginService allows the user to login to the server
@Injectable()
class RegistrationService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _loginUrl = "/api/v1/register";
  final Client _http;

  /// Constructor which also initializes the http connection
  RegistrationService(this._http);

  /// Checks is a user already logged in, if not, it sends the request
  Future<LoginResponse> register(LoginRequest req) async {
    if (window.localStorage['session_token'] != null) {
      return new LoginResponse(
        token: window.localStorage['session_token'],
        email: window.localStorage['email'],
      );
    }

    if (req == null) {
      return null;
    }

    try {
      final _resp = await _http.post(
        _loginUrl,
        headers: _headers,
        body: JSON.encode(req));

      final res = new LoginResponse.fromJson(JSON.decode(_resp.body))
        ..email = req.email;
      print('has response');
      window.localStorage['session_token'] = res.token;
      window.localStorage['email'] = res.email;

      return res;
    } on Exception catch(e) {
      throw _handleError(e);
    }
  }
}

Exception _handleError(e) {
  print(e);
  return new Exception('Server error: $e');
}