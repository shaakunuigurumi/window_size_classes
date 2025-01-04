import 'package:flutter/widgets.dart';

import 'breakpoints.dart';

/// <https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes>
enum WindowHeightClass {
  compact,
  medium,
  expanded;

  static WindowHeightClass of(BuildContext context) {
    return fromHeight(MediaQuery.sizeOf(context).height);
  }

  static WindowHeightClass fromHeight(num height) {
    return switch (height) {
      >= expandedHeightBreakpoint => WindowHeightClass.expanded,
      >= mediumHeightBreakpoint => WindowHeightClass.medium,
      _ => WindowHeightClass.compact,
    };
  }

  bool operator <(WindowHeightClass other) => index < other.index;

  bool operator <=(WindowHeightClass other) => index <= other.index;

  bool operator >(WindowHeightClass other) => index > other.index;

  bool operator >=(WindowHeightClass other) => index >= other.index;
}
