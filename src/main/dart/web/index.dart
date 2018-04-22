import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

// import 'package:assignment2/in_memory_data_service.dart';


import 'package:assignment2/app_component.dart';

void main() {
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy),
    provide(Client, useFactory: () => new BrowserClient(), deps: [])
    // provide(Client, useClass: InMemoryDataService),
  ]);
}