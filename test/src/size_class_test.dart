import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:window_size_classes/window_size_classes.dart';

void main() {
  final breakpoints = [
    (0.0, 0.0),
    (mediumWidthBreakpoint, mediumHeightBreakpoint),
    (expandedWidthBreakpoint, expandedHeightBreakpoint),
  ];

  for (final (width, height) in breakpoints) {
    testWidgets(
      'helper matches individual methods ($width, $height)',
      (tester) async {
        final key = GlobalKey();

        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(size: Size(width, height)),
            child: SizedBox(key: key),
          ),
        );

        final context = key.currentContext!;

        final (widthClass, heightClass) = WindowSizeClass.of(context);

        final actualWidthClass = WindowWidthClass.of(context);
        expect(widthClass, actualWidthClass);

        final actualHeightClass = WindowHeightClass.of(context);
        expect(heightClass, actualHeightClass);
      },
    );
  }
}
