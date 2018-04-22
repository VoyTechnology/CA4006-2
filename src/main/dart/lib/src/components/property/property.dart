import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_tab/material_tab.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:markdown/markdown.dart';

import '../../datatypes/Property.dart';
import '../../services/login.dart';
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
    formDirectives,
  ],
  providers: const [
    PropertyService,
    LoginService,
  ],
  pipes: const [COMMON_PIPES, MarkdownPipe],
)
class PropertyDetailComponent implements OnInit {
  final PropertyService _propertyService;
  final LoginService _loginService;
  final RouteParams _routeParams;
  final Router _router;

  /// The actual property
  Property property;

  /// new property to create
  Property newProperty = new Property();
  
  /// Should the page instead be a page to create a new property
  bool makeNewProperty;

  /// Creates the component
  PropertyDetailComponent(
    this._propertyService,
    this._loginService,
    this._routeParams,
    this._router,
  );

  Future<Null> _getProperty() async {
    final _id = _routeParams.get('id');
    if (_id == 'new') {
      if (await _loginService.login(null) == null) {
        await _router.navigate(['Login']).whenComplete(() {});
      }

      makeNewProperty = true;
      return;
    }

    final id = int.parse(_id ?? '', onError: (_) => -1);
    if (id != -1) {
      property = await _propertyService.property(id);
      print(property.askingPrice.toString());
    }
  }

  @override
  Future<Null> ngOnInit() => _getProperty();

  /// Activated when form is submited
  void onSubmit() {
    newProperty.postedTimestamp = new DateTime.now();
    _propertyService.create(newProperty)
      .then((res) {
        if (res.error == null) {
          _router.navigate(['Dashboard']).whenComplete(() {});
        }
      })
      .whenComplete(() {});
  }
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