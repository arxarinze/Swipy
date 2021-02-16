import 'dart:html';

import 'package:angular/angular.dart';

@Directive(selector: '[swipy]')
class Swipy {
  var start_x = 0;
  var start_y = 0;
  var end_x = 0;
  var end_y = 0;
  @Input()
  dynamic swipeLeft;
  @Input()
  dynamic swipeRight;
  final Element _el;
  Swipy(this._el) {
    _el.addEventListener('touchstart', (event) {
      var a = (event as TouchEvent);
      a.preventDefault();
      start_x = a.changedTouches[0].page.x;
      start_y = a.changedTouches[0].page.y;
    });
    _el.addEventListener('touchend', (event) {
      var a = (event as TouchEvent);
      end_x = a.changedTouches[0].page.x;
      end_y = a.changedTouches[0].page.y;

      if ((end_x - start_x) <= -30 && (end_y - start_y) <= 100) {
        swipeLeft();
      }
      if ((end_x - start_x) >= 30 && (end_y - start_y) <= 100) {
        swipeRight();
      }
    });
  }
}
