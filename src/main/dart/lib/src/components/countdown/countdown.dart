import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

/// Countdown timer
@Component(
  selector: 'bidding-countdown',
  template: '<span>{{time}}</span>',
  directives: const [
    CORE_DIRECTIVES,
    ROUTER_DIRECTIVES,
  ],
)
class CountdownComponent {
  /// Constructor
  CountdownComponent() {
    new Timer.periodic(const Duration(seconds: 1), (_) {
      if (countdownTo != null) {
        final until = new DateTime.fromMillisecondsSinceEpoch(
          int.parse(countdownTo, onError: (_) => 0));
        time = until.difference(new DateTime.now()).toString();
      }
    });
  }

  /// The Unix timestamp to count down to
  @Input()
  String countdownTo;

  /// The time to be displayed
  String time = '...';
}