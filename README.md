# Window size classes

A Flutter package which provides window size classes as defined by Material Design 3.

For guidance, please refer to the [Material Design 3 documentation](https://m3.material.io/foundations/layout/applying-layout/window-size-classes).

## Features

- Window width classes [as defined by Material Design 3](https://m3.material.io/foundations/layout/applying-layout/window-size-classes)
- Window height classes [as defined by Android](https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes)
- General breakpoint values
- Comparison operators
- `of(context)` helper method

## Usage

```dart
import 'package:window_size_classes/window_size_classes.dart';

// ...

Widget build(BuildContext context) {
  final widthClass = WindowWidthClass.of(context);

  if (widthClass > WindowWidthClass.compact) {
     return Text('So much space!'); 
  }
  
  return Text('Not enough space!');
}
```