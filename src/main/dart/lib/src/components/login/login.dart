import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

// import '../../datatypes/Login.dart';

/// Login page
@Component(
  selector: 'login-page',
  templateUrl: 'login.html',
  styleUrls: const [],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives],
)
class LoginComponent implements OnInit {
  // LoginRequest _req;

  @override
  Future<Null> ngOnInit() async {}
}