import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:window_size_classes/src/breakpoints.dart';
import 'package:window_size_classes/src/width_class.dart';

/// Opinionated set of vertical viewport breakpoints.
///
/// [WindowHeightClass] can be used to adjust the layout when available vertical
/// space is unusually small or large.
///
/// However, since most layouts contain vertically scrolling content, it's rare
/// that layouts need to adjust to available height.
///
/// ```dart
/// final heightClass = WindowHeightClass.of(context);
///
/// if (heightClass == WindowHeightClass.compact) {
///   // Adapt UI for limited vertical space
/// }
/// ```
///
/// See also:
///
///  * <https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes>
///  * [WindowWidthClass], for categorizing horizontal space.
///  * [MediaQuery.sizeOf], which provides the window dimensions.
enum WindowHeightClass implements Comparable<WindowHeightClass> {
  /// Compact height class.
  ///
  /// Applies to windows with height less than [mediumHeightBreakpoint]
  /// (480 logical pixels).
  ///
  /// Common devices:
  ///
  /// - Phones in landscape
  ///
  /// See also:
  ///
  ///  * <https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes>
  compact,

  /// Medium height class.
  ///
  /// Applies to windows with a height of at least [mediumHeightBreakpoint]
  /// (480 logical pixels) and less than [expandedHeightBreakpoint] (900
  /// logical pixels).
  ///
  /// Common devices:
  ///
  /// - Tablets in landscape
  /// - Phones in portrait
  ///
  /// See also:
  ///
  ///  * <https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes>
  medium,

  /// Expanded height class.
  ///
  /// Applies to windows with height of [expandedHeightBreakpoint] (900 logical
  /// pixels) or more.
  ///
  /// Common devices:
  ///
  /// - Tablets in portrait
  ///
  /// See also:
  ///
  ///  * <https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes>
  expanded;

  /// Returns the [WindowHeightClass] for the current screen height.
  ///
  /// Retrieves the screen height from [MediaQuery] and determines the
  /// appropriate [WindowHeightClass] based on the Android breakpoints.
  ///
  /// The [context] must have a [MediaQuery] ancestor.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   final heightClass = WindowHeightClass.of(context);
  ///   // This value can change during the app's lifetime
  ///   // Adapt your layout based on available vertical space...
  /// }
  /// ```
  @useResult
  @pragma('dart2js:tryInline')
  @pragma('vm:prefer-inline')
  @pragma('wasm:prefer-inline')
  static WindowHeightClass of(BuildContext context) {
    return fromHeight(MediaQuery.sizeOf(context).height);
  }

  /// Returns the [WindowHeightClass] for the given [height] value.
  ///
  /// The [height] parameter should be in logical pixels.
  /// This method applies breakpoint logic to determine the appropriate
  /// height class for the available vertical space.
  ///
  /// ```dart
  /// final heightClass = WindowHeightClass.fromHeight(600); // Returns medium
  /// final heightClass = WindowHeightClass.fromHeight(1000); // Returns expanded
  /// ```
  @useResult
  static WindowHeightClass fromHeight(num height) {
    return switch (height) {
      >= expandedHeightBreakpoint => WindowHeightClass.expanded,
      >= mediumHeightBreakpoint => WindowHeightClass.medium,
      _ => WindowHeightClass.compact,
    };
  }

  /// Whether this height class is smaller than [other].
  ///
  /// Returns `true` if this height class is smaller than [other].
  /// Returns `false` if this height class is greater than or equal to [other].
  bool operator <(WindowHeightClass other) => index < other.index;

  /// Whether this height class is smaller than or equal to [other].
  ///
  /// Returns `true` if this height class is smaller than or equal to [other].
  /// Returns `false` if this height class is greater than [other].
  bool operator <=(WindowHeightClass other) => index <= other.index;

  /// Whether this height class is greater than [other].
  ///
  /// Returns `true` if this height class is greater than [other].
  /// Returns `false` if this height class is smaller than or equal to [other].
  bool operator >(WindowHeightClass other) => index > other.index;

  /// Whether this height class is greater than or equal to [other].
  ///
  /// Returns `true` if this height class is greater than or equal to [other].
  /// Returns `false` if this height class is smaller than [other].
  bool operator >=(WindowHeightClass other) => index >= other.index;

  /// Compares this [WindowHeightClass] to [other].
  ///
  /// Returns a negative integer if this [WindowHeightClass] represents a
  /// smaller height than [other], zero if they represent the same height class,
  /// or a positive integer if this [WindowHeightClass] represents a larger
  /// height than [other].
  @override
  @pragma('dart2js:tryInline')
  @pragma('vm:prefer-inline')
  @pragma('wasm:prefer-inline')
  int compareTo(WindowHeightClass other) => index.compareTo(other.index);
}
