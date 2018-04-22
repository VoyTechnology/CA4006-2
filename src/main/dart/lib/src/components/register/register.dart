import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../datatypes/Login.dart';
import '../../services/register.dart';

/// Login page
@Component(
  selector: 'registration-page',
  templateUrl: 'register.html',
  styleUrls: const [],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives],
  providers: const [RegistrationService],
)
class RegistrationComponent implements OnInit {
  final RegistrationService _registrationService;
  final Router _router;

  /// LoginRequest used for binding
  LoginRequest req = new LoginRequest();

  /// Constructor
  RegistrationComponent(this._registrationService, this._router);

  /// Activated when form is submited
  void onSubmit() {
    _registrationService.register(req)
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