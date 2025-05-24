import 'dart:math';

import 'package:flutter/widgets.dart';

EdgeInsets maxEdgeInsets(EdgeInsets a, EdgeInsets b) {
  return EdgeInsets.fromLTRB(
    max(a.left, b.left),
    max(a.top, b.top),
    max(a.right, b.right),
    max(a.bottom, b.bottom),
  );
}
