import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../../services/login.dart';

/// Contains the header
@Component(
  selector: 'app-header',
  templateUrl: 'header.html',
  styleUrls: const [
    'package:angular_components/app_layout/layout.scss.css',
    'header.css',
  ],
  directives: const [
    CORE_DIRECTIVES,
    ROUTER_DIRECTIVES,
    // MaterialPersistentDrawerDirective,
  ],
  providers: const [
    LoginService,
  ]
)
class AppHeaderComponent implements OnInit {
  final LoginService _loginService;

  /// Header title
  String title = "Property Listings";

  /// Email address of the user
  String email;

  /// AppHeader constructor
  AppHeaderComponent(
    this._loginService,
  );

  Future<Null> _initializeHeader() async {
    final _userInfo = await _loginService.login(null);
    
    if (_userInfo != null) {
      email = _userInfo.email;
    }
  }

  @override
  Future<Null> ngOnInit() => _initializeHeader();
}