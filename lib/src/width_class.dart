import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'package:window_size_classes/src/breakpoints.dart';
import 'package:window_size_classes/src/height_class.dart';

/// Opinionated set of horizontal viewport breakpoints.
///
/// ```dart
/// final widthClass = WindowWidthClass.of(context);
///
/// return switch (widthClass) {
///   WindowWidthClass.compact => CompactLayout(),
///   WindowWidthClass.medium => MediumLayout(),
///   WindowWidthClass.expanded => ExpandedLayout(),
///   _ => LargeLayout(), // large and extraLarge
/// };
/// ```
///
/// See also:
///
///  * <https://m3.material.io/foundations/layout/applying-layout/window-size-classes>
///  * [WindowHeightClass], for height-based classifications.
///  * [MediaQuery.sizeOf], which provides the window dimensions.
enum WindowWidthClass implements Comparable<WindowWidthClass> {
  /// Compact window width.
  ///
  /// Applies to windows with width less than [mediumWidthBreakpoint] (600
  /// logical pixels).
  ///
  /// Common devices:
  ///
  /// - Phone in portrait
  ///
  /// See also:
  ///
  ///  * <https://m3.material.io/foundations/layout/applying-layout/compact>
  compact(spacing: 16),

  /// Medium window width.
  ///
  /// Applies to windows with width of at least [mediumWidthBreakpoint]
  /// (600 logical pixels) and less than [expandedWidthBreakpoint] (840
  /// logical pixels).
  ///
  /// Common devices:
  ///
  /// - Tablet in portrait
  /// - Foldable in portrait (unfolded)
  ///
  /// See also:
  ///
  ///  * <https://m3.material.io/foundations/layout/applying-layout/medium>
  medium(spacing: 24),

  /// Expanded window width.
  ///
  /// Applies to windows with a width of at least [expandedWidthBreakpoint]
  /// (840 logical pixels) and less than [largeWidthBreakpoint] (1200 logical
  /// pixels). Enables multi-column layouts, side-by-side content, and expanded
  /// navigation patterns that take advantage of additional horizontal real
  /// estate.
  ///
  /// Common devices:
  ///
  /// - Phone in landscape
  /// - Tablet in landscape
  /// - Foldable in landscape (unfolded)
  /// - Desktop
  ///
  /// See also:
  ///
  ///  * <https://m3.material.io/foundations/layout/applying-layout/expanded>
  expanded(spacing: 24),

  /// Large window width.
  ///
  /// Applies to windows with a width of at least [largeWidthBreakpoint]
  /// (1200 logical pixels) and less than [extraLargeWidthBreakpoint]
  /// (1600 logical pixels). Includes a [fixedPaneWidth] of 360.0 to maintain
  /// optimal content organization and reading lengths despite the generous
  /// horizontal space available.
  ///
  /// Common devices:
  ///
  /// - Desktop
  ///
  /// See also:
  ///
  ///  * <https://m3.material.io/foundations/layout/applying-layout/large-extra-large>
  large(spacing: 24, fixedPaneWidth: 360),

  /// Extra large window width.
  ///
  /// Applies to windows with width of [extraLargeWidthBreakpoint] (1600
  /// logical pixels) or more.
  /// Features a larger [fixedPaneWidth] of 412.0 logical pixels to maintain
  /// readable content proportions and prevent over-stretching of content
  /// across very wide horizontal spaces.
  ///
  /// Common devices:
  ///
  /// - Desktop
  /// - Ultra-wide
  ///
  /// See also:
  ///
  ///  * <https://m3.material.io/foundations/layout/applying-layout/large-extra-large>
  extraLarge(spacing: 24, fixedPaneWidth: 412);

  /// Creates a window width class with the given [spacing] and optional
  /// [fixedPaneWidth].
  const WindowWidthClass({required this.spacing, this.fixedPaneWidth});

  /// Value used for layout margin and pane spacing.
  final double spacing;

  /// The fixed pane width for [large] and [extraLarge] width classes.
  ///
  /// When not null, this value suggests a width for fixed panes.
  final double? fixedPaneWidth;

  /// Returns the [WindowWidthClass] for the current screen width.
  ///
  /// Retrieves the screen width from [MediaQuery] and determines the
  /// appropriate [WindowWidthClass] based on the Material Design 3 breakpoints.
  ///
  /// The [context] must have a [MediaQuery] ancestor.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   final widthClass = WindowWidthClass.of(context);
  ///   // Use widthClass to adapt your layout...
  /// }
  /// ```
  @useResult
  @pragma('vm:prefer-inline')
  static WindowWidthClass of(BuildContext context) {
    return fromWidth(MediaQuery.sizeOf(context).width);
  }

  /// Returns the [WindowWidthClass] for the given [width] value.
  ///
  /// The [width] parameter should be in logical pixels.
  /// This method applies Material Design 3 breakpoint logic to
  /// determine the appropriate width class.
  ///
  /// ```dart
  /// final widthClass = WindowWidthClass.fromWidth(800); // Returns medium
  /// final widthClass = WindowWidthClass.fromWidth(1400); // Returns large
  /// ```
  @useResult
  static WindowWidthClass fromWidth(num width) {
    return switch (width) {
      >= extraLargeWidthBreakpoint => WindowWidthClass.extraLarge,
      >= largeWidthBreakpoint => WindowWidthClass.large,
      >= expandedWidthBreakpoint => WindowWidthClass.expanded,
      >= mediumWidthBreakpoint => WindowWidthClass.medium,
      _ => WindowWidthClass.compact,
    };
  }

  /// Whether this height class is smaller than [other].
  ///
  /// Returns `true` if this height class is smaller than [other].
  /// Returns `false` if this height class is greater than or equal to [other].
  bool operator <(WindowWidthClass other) => index < other.index;

  /// Whether this height class is smaller than or equal to [other].
  ///
  /// Returns `true` if this height class is smaller than or equal to [other].
  /// Returns `false` if this height class is greater than [other].
  bool operator <=(WindowWidthClass other) => index <= other.index;

  /// Whether this height class is greater than [other].
  ///
  /// Returns `true` if this height class is greater than [other].
  /// Returns `false` if this height class is smaller than or equal to [other].
  bool operator >(WindowWidthClass other) => index > other.index;

  /// Whether this height class is greater than or equal to [other].
  ///
  /// Returns `true` if this height class is greater than or equal to [other].
  /// Returns `false` if this height class is smaller than [other].
  bool operator >=(WindowWidthClass other) => index >= other.index;

  /// Compares this [WindowWidthClass] to [other].
  ///
  /// Returns a negative integer if this [WindowWidthClass] represents a smaller
  /// width than [other], zero if they represent the same width class, or a
  /// positive integer if this [WindowWidthClass] represents a larger width than
  /// [other].
  @override
  @pragma('dart2js:tryInline')
  @pragma('vm:prefer-inline')
  @pragma('wasm:prefer-inline')
  int compareTo(WindowWidthClass other) => index.compareTo(other.index);
}
