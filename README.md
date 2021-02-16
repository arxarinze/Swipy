A swipe detection directive.

## Usage

A simple usage example: (Currently in beta mode)

```dart
import 'package:swipy/swipy.dart';

@Component(
  ...
  directives: [Swipy],
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/arxarinze/Swipy/issues
