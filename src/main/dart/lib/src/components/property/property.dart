import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_tab/material_tab.dart';
import 'package:angular_router/angular_router.dart';
import 'package:markdown/markdown.dart';

// import '../../datatypes/Address.dart';
import '../../datatypes/Property.dart';
// import '../../services/eircode.dart';
import '../../services/property.dart';

/// Property details page
@Component(
  selector: 'property-detail',
  templateUrl: 'property.html',
  styleUrls: const [
    'property.css',
  ],
  directives: const [
    CORE_DIRECTIVES,
    ROUTER_DIRECTIVES,
    DeferredContentDirective,
    MaterialTabComponent,
    MaterialIconComponent,
  ],
  providers: const [
    PropertyService,
    // EircodeService,  
  ],
  pipes: const [COMMON_PIPES, MarkdownPipe],
)
class PropertyDetailComponent implements OnInit {
  final PropertyService _propertyService;
  // final EircodeService _eircodeService;
  final RouteParams _routeParams;

  /// The actual property
  Property property;
  /// Address of the property
  // Address address;

  /// Creates the component
  PropertyDetailComponent(
    this._propertyService,
    // this._eircodeService,
    this._routeParams,
  );

  Future<Null> _getProperty() async {
    final _id = _routeParams.get('id');
    final id = int.parse(_id ?? '', onError: (_) => -1);
    if (id != -1) {
      property = await _propertyService.property(id);
      // address = await _eircodeService.address(_property.eircode);
    }
  }

  @override
  Future<Null> ngOnInit() => _getProperty();
}


/// converts Markdown to HTML
/// Usage:
///   value | markdown
/// Example:
///   {{ "__Hello__" | markdown}}
///   formats to: <b>Hello</b>
@Pipe('markdown')
class MarkdownPipe extends PipeTransform {
  /// Transform the given string to markdown
  String transform(String value) => markdownToHtml(value);
}