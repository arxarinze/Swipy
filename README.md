A touch detection directive for AngularDart. Features include touch, swiping, panning, dragging and dropping.

## Onycha Usage

A simple usage example: (Currently in beta mode)

```dart
import 'package:onycha/onycha.dart';

@Component(
  ...
  directives: [Swipy, Touchy],
)
class ExampleComponent{

  void swR(){
    ...
  }

  void swL(){
    ...
  }

  void swD(){
    ...
  }

  void swU(){
    ...
  }
  void soft(){

  }
  void hard(){

  }
}
```

```html
<div
  swipy
  [swipeLeft]="swL"
  [swipeRight]="swR"
  [swipeDown]="swD"
  [swipeUp]="swU"
></div>

<div touchy [softTouchy]="soft" [hardTouchy]="hard"></div>
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/arxarinze/Swipy/issues
