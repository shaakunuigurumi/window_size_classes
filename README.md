[![codecov](https://codecov.io/gh/shaakunuigurumi/window_size_classes/graph/badge.svg?token=t2xpJp3YpI)](https://codecov.io/gh/shaakunuigurumi/window_size_classes)

A Flutter package that provides window size classes as defined by Material Design 3. Inspired by Jetpack Compose.

## Features

- Width classes from Material Design 3: compact, medium, expanded, large, extra-large
- Height classes from Android: compact, medium, expanded
- Comparison operators & `Comparable<T>`
- `of(context)` method for widgets
- Raw breakpoint values

## Usage

### Matching window classes to layouts

```dart
import 'package:window_size_classes/window_size_classes.dart';

Widget build(BuildContext context) {
  final widthClass = WindowWidthClass.of(context);

  return switch (widthClass) {
    WindowWidthClass.compact => CompactLayout(),
    WindowWidthClass.medium => MediumLayout(),
    WindowWidthClass.expanded => ExpandedLayout(),
    _ => LargeLayout(), // large and extraLarge
  };
}
```

### Responsive Navigation

```dart
Widget build(BuildContext context) {
  final widthClass = WindowWidthClass.of(context);
  
  if (widthClass >= WindowWidthClass.expanded) {
    // Wide layout: permanent navigation rail
    return Row(children: [
      NavigationRail(/* ... */),
      Expanded(child: content),
    ]);
  } else {
    // Narrow layout: bottom navigation or drawer
    return Scaffold(
      body: content,
      bottomNavigationBar: BottomNavigationBar(/* ... */),
    );
  }
}
```

### Using Height Classes

```dart
Widget build(BuildContext context) {
  final heightClass = WindowHeightClass.of(context);
  
  return Scaffold(
    appBar: heightClass != WindowHeightClass.compact 
        ? AppBar(title: Text('My App'))  // Hide app bar when height is limited
        : null,
    body: content,
  );
}
```

### Comparison Operators

```dart
Widget build(BuildContext context) {
  final showSidebar = WindowWidthClass.of(context) > WindowWidthClass.compact;
  
  return showSidebar 
    ? TwoColumnLayout() 
    : SingleColumnLayout();
}
```

## Resources

- <https://m3.material.io/foundations/layout/applying-layout/window-size-classes>
- <https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes>
- <https://docs.flutter.dev/ui/adaptive-responsive>