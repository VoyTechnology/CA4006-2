import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../datatypes/Login.dart';
import '../../services/login.dart';

/// Login page
@Component(
  selector: 'login-page',
  templateUrl: 'login.html',
  styleUrls: const [],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives],
  providers: const [LoginService],
)
class LoginComponent implements OnInit {
  final LoginService _loginService;
  final Router _router;

  /// LoginRequest used for binding
  LoginRequest req = new LoginRequest();

  /// Constructor
  LoginComponent(this._loginService, this._router);

  /// Activated when form is submited
  void onSubmit() {
    _loginService.login(req)
      .then((res) {
        if (res.error == null) {
          _router.navigate(['Dashboard']).whenComplete(() {});
        }
      })
      .whenComplete(() {});
  }


  @override
  Future<Null> ngOnInit() async {}
}