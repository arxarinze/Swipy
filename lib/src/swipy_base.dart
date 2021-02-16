import 'dart:html';

import 'package:angular/angular.dart';

@Directive(selector: '[swipy]')
class Swipy {
  var start_x = 0;
  var start_y = 0;
  var end_x = 0;
  var end_y = 0;

  Swipy(Element el) {
    el.addEventListener('touchstart', (event) {
      var a = (event as TouchEvent);
      a.preventDefault();
      start_x = a.changedTouches[0].page.x;
      start_y = a.changedTouches[0].page.y;
    });
    el.addEventListener('touchend', (event) {
      var a = (event as TouchEvent);
      end_x = a.changedTouches[0].page.x;
      end_y = a.changedTouches[0].page.y;

      if ((end_x - start_x) <= -50 && (end_y - start_y) <= 100) {
        print('swwiped');
      }
      if ((end_x - start_x) >= 50 && (end_y - start_y) <= 100) {
        print('swiped');
      }
    });
  }
}
