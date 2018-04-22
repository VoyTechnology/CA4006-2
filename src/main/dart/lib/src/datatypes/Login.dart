/// Login Request contains the information about the user which is used for
/// login
class LoginRequest {
  /// email address of the user
  String email;
  /// password of the user
  String password;

  /// Login request
  LoginRequest({this.email, this.password});

  /// creates a new login request from map
  factory LoginRequest.fromJson(Map<String, dynamic> json) => new LoginRequest(
    email: json['email'],
    password: json['password'],
  );
}

/// Response received from the server.
class LoginResponse {
  /// Token used for any future requests which require authentication.
  /// This is returned only if everything goes well.
  String token;
  /// Error is returned whenever there was a problem with the login. The
  /// field contains the cause of failure.
  String error;

  /// Login response constructor
  LoginResponse({this.token, this.error});

  /// creates a new login request from map
  factory LoginResponse.fromJson(Map<String, dynamic> json) => new LoginResponse(
    token: json['token'],
    error: json['error'],
  );
}