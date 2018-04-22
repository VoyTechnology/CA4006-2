import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../../datatypes/Property.dart';
import '../../services/properties.dart';
import '../countdown/countdown.dart';

/// Dashboard showing all properties
@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard.html',
  styleUrls: const ['dashboard.css'],
  directives: const [
    CORE_DIRECTIVES,
    ROUTER_DIRECTIVES,
    CountdownComponent
  ],
  providers: const [PropertiesService],
  pipes: const [COMMON_PIPES],
)
class DashboardComponent implements OnInit {
  final PropertiesService _propertiesService;
  /// List of properties, with only some fields so it can be displayed on the
  /// front page
  List<Property> properties;

  /// Dashboard constructor
  DashboardComponent(this._propertiesService);

  Future<Null> _getProperties() async {
    properties = await _propertiesService.properties();
  }

  @override
  Future<Null> ngOnInit() => _getProperties();
}