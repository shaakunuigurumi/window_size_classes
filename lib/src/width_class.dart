import 'package:flutter/widgets.dart';

import 'breakpoints.dart';

/// <https://m3.material.io/foundations/layout/applying-layout/window-size-classes>
enum WindowWidthClass {
  /// <https://m3.material.io/foundations/layout/applying-layout/compact>
  compact(spacing: 16.0),
  /// <https://m3.material.io/foundations/layout/applying-layout/medium>
  medium(spacing: 24.0),
  /// <https://m3.material.io/foundations/layout/applying-layout/expanded>
  expanded(spacing: 24.0),
  /// <https://m3.material.io/foundations/layout/applying-layout/large-extra-large>
  large(spacing: 24.0, fixedPaneWidth: 360.0),
  /// <https://m3.material.io/foundations/layout/applying-layout/large-extra-large>
  extraLarge(spacing: 24.0, fixedPaneWidth: 412.0);

  final double spacing;

  final double? fixedPaneWidth;

  const WindowWidthClass({required this.spacing, this.fixedPaneWidth});

  static WindowWidthClass of(BuildContext context) {
    return fromWidth(MediaQuery.sizeOf(context).width);
  }

  static WindowWidthClass fromWidth(num width) {
    return switch (width) {
      >= extraLargeWidthBreakpoint => WindowWidthClass.extraLarge,
      >= largeWidthBreakpoint => WindowWidthClass.large,
      >= expandedWidthBreakpoint => WindowWidthClass.expanded,
      >= mediumWidthBreakpoint => WindowWidthClass.medium,
      _ => WindowWidthClass.compact,
    };
  }

  bool operator <(WindowWidthClass other) => index < other.index;

  bool operator <=(WindowWidthClass other) => index <= other.index;

  bool operator >(WindowWidthClass other) => index > other.index;

  bool operator >=(WindowWidthClass other) => index >= other.index;
}
