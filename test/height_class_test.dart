import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:window_size_classes/window_size_classes.dart';

void main() {
  group('operators', () {
    test('compact is smaller than medium', () {
      expect(WindowHeightClass.compact < WindowHeightClass.medium, isTrue);
    });

    test('medium is larger than compact', () {
      expect(WindowHeightClass.medium > WindowHeightClass.compact, isTrue);
    });

    test('compact is smaller than or equal to compact', () {
      expect(WindowHeightClass.compact <= WindowHeightClass.compact, isTrue);
    });

    test('compact is larger than or equal to compact', () {
      expect(WindowHeightClass.compact <= WindowHeightClass.compact, isTrue);
    });

    test('compact is smaller than or equal to medium', () {
      expect(WindowHeightClass.compact <= WindowHeightClass.medium, isTrue);
    });

    test('medium is larger than or equal to compact', () {
      expect(WindowHeightClass.medium >= WindowHeightClass.compact, isTrue);
    });
  });

  group('MediaQuery', () {
    testWidgets('height class is compact in 300px media height',
        (WidgetTester tester) async {
      final key = GlobalKey();

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(600, 300)),
          child: SizedBox(key: key),
        ),
      );

      expect(
        WindowHeightClass.of(key.currentContext!),
        WindowHeightClass.compact,
      );
    });

    testWidgets('height class is medium in 600px media height',
        (WidgetTester tester) async {
      final key = GlobalKey();

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(0, 600)),
          child: SizedBox(key: key),
        ),
      );

      expect(
        WindowHeightClass.of(key.currentContext!),
        WindowHeightClass.medium,
      );
    });

    testWidgets('height class is expanded in 1000px media height',
        (WidgetTester tester) async {
      final key = GlobalKey();

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(0, 1000)),
          child: SizedBox(key: key),
        ),
      );

      expect(
        WindowHeightClass.of(key.currentContext!),
        WindowHeightClass.expanded,
      );
    });
  });
}
