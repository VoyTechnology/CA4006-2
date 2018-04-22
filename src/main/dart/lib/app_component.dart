// import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/components/dashboard/dashboard.dart';
import 'src/components/header/header.dart';
import 'src/components/login/login.dart';
import 'src/components/property/property.dart';
import 'src/components/register/register.dart';

/// Main entrypoint
@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: const [
    'package:angular_components/app_layout/layout.scss.css',
    'app_component.css'
  ],
  directives: const [ROUTER_DIRECTIVES, AppHeaderComponent],
)
@RouteConfig(const [
  const Route(
    path: '/',
    name: 'Dashboard',
    component: DashboardComponent,
  ),
  const Route(
    path: '/login',
    name: 'Login',
    component: LoginComponent,
  ),
  const Route(
    path: '/register',
    name: 'Register',
    component: RegistrationComponent,
  ),
  const Route(
    path: '/property/:id',
    name: 'PropertyDetail',
    component: PropertyDetailComponent,
  ),
])
class AppComponent {
  /// Title of the page
  final String title = 'Property Listings';
}