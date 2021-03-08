import 'dart:html';

import 'package:angular/angular.dart';

@Directive(selector: '[swipy]')
class Swipy {
  var start_x = 0;
  var start_y = 0;
  var end_x = 0;
  var end_y = 0;
  @Input()
  dynamic swipeLeft, swipeRight, swipeUp, swipeDown;
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
      } else if ((end_x - start_x) >= 30 && (end_y - start_y) <= 100) {
        swipeRight();
      } else if ((end_x - start_x) <= 100 && (end_y - start_y) <= 30) {
        swipeUp();
      } else if ((end_x - start_x) <= 100 && (end_y - start_y) >= -30) {
        swipeDown();
      }
    });
  }
}

@Directive(selector: '[touchy]')
class Touchy {
  @Input()
  dynamic softTouchy, hardTouchy;
  @Input()
  List<dynamic> args;
  var startTime, endTime;

  final Element _el;
  Touchy(this._el) {
    _el.addEventListener('mousedown', (event) {
      event.preventDefault();
    });
    _el.addEventListener('mouseup', (event) {
      event.preventDefault();
    });
    _el.addEventListener('touchstart', (event) {
      startTime = DateTime.now();
      print(startTime);
    });
    _el.addEventListener('touchmove', (event) {
      startTime = DateTime.now();
      endTime = startTime;
    });
    _el.addEventListener('touchend', (event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      event.stopPropagation();
      endTime = DateTime.now();
      if (startTime != 0) {
        if (endTime.difference(startTime).inMilliseconds >= 500) {
          if (hardTouchy != null && args != null) {
            hardTouchy(args[0], args[1]);
          } else if (hardTouchy != null && args == null) {
            hardTouchy();
          }
        } else if (endTime.difference(endTime).inMilliseconds <= 499 &&
            endTime.difference(endTime).inMilliseconds > 0) {
          if (softTouchy != null && args != null) {
            softTouchy(args[0], args[1]);
          } else if (softTouchy != null && args == null) {
            softTouchy();
          }
        }
      }
    });
  }
}
