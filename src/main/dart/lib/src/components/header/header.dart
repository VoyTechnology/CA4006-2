import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
// import 'package:angular_components/app_layout/material_persistent_drawer.dart';

/// Contains the header
@Component(
  selector: 'app-header',
  templateUrl: 'header.html',
  styleUrls: const [
    'package:angular_components/app_layout/layout.scss.css',
    'header.css',
  ],
  directives: const [
    ROUTER_DIRECTIVES,
    // MaterialPersistentDrawerDirective,
  ],
)
class AppHeaderComponent {
  /// Header title
  String title = "Property Listings";

  /// AppHeader constructor
  AppHeaderComponent();
}