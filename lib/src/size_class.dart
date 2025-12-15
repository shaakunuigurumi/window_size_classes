import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:window_size_classes/src/height_class.dart';
import 'package:window_size_classes/src/width_class.dart';

/// Helper class for retrieving the [WindowWidthClass] and [WindowHeightClass]
/// for the current screen size.
///
/// See also:
///
/// - [of]
abstract final class WindowSizeClass {
  /// Returns the [WindowWidthClass] and [WindowHeightClass] for the current
  /// screen size.
  ///
  /// The [context] must have a [MediaQuery] ancestor.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   final (widthClass, heightClass) = WindowSizeClass.of(context);
  ///   // Use widthClass and heightClass to adapt your layout...
  /// }
  /// ```
  @useResult
  @pragma('dart2js:tryInline')
  @pragma('vm:prefer-inline')
  @pragma('wasm:prefer-inline')
  static (WindowWidthClass widthClass, WindowHeightClass heightClass) of(
    BuildContext context,
  ) {
    return fromSize(MediaQuery.sizeOf(context));
  }

  /// Returns the [WindowWidthClass] and [WindowHeightClass] for the given
  /// [size].
  ///
  /// ```dart
  /// final (widthClass, heightClass) = WindowSizeClass.fromSize(size);
  /// ```
  @useResult
  @pragma('dart2js:tryInline')
  @pragma('vm:prefer-inline')
  @pragma('wasm:prefer-inline')
  static (WindowWidthClass widthClass, WindowHeightClass heightClass) fromSize(
    Size size,
  ) {
    final Size(:width, :height) = size;
    return (
      WindowWidthClass.fromWidth(width),
      WindowHeightClass.fromHeight(height),
    );
  }
}
