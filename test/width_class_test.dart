import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:window_size_classes/window_size_classes.dart';

void main() {
  group('operators', () {
    test('compact is smaller than medium', () {
      expect(WindowWidthClass.compact < WindowWidthClass.medium, isTrue);
    });

    test('medium is larger than compact', () {
      expect(WindowWidthClass.medium > WindowWidthClass.compact, isTrue);
    });

    test('compact is smaller than or equal to compact', () {
      expect(WindowWidthClass.compact <= WindowWidthClass.compact, isTrue);
    });

    test('compact is larger than or equal to compact', () {
      expect(WindowWidthClass.compact <= WindowWidthClass.compact, isTrue);
    });

    test('compact is smaller than or equal to medium', () {
      expect(WindowWidthClass.compact <= WindowWidthClass.medium, isTrue);
    });

    test('medium is larger than or equal to compact', () {
      expect(WindowWidthClass.medium >= WindowWidthClass.compact, isTrue);
    });
  });

  group('Comparable', () {
    test('compact is smaller than medium', () {
      expect(
        WindowWidthClass.compact.compareTo(WindowWidthClass.medium),
        lessThan(0),
      );
    });

    test('medium is larger than compact', () {
      expect(
        WindowWidthClass.medium.compareTo(WindowWidthClass.compact),
        greaterThan(0),
      );
    });

    test('compact is equal to compact', () {
      expect(
        WindowWidthClass.compact.compareTo(WindowWidthClass.compact),
        equals(0),
      );
    });
  });

  group('MediaQuery', () {
    testWidgets('width class is compact in 250px media width',
        (WidgetTester tester) async {
      final key = GlobalKey();

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(250, 600)),
          child: SizedBox(key: key),
        ),
      );

      final widthClass = WindowWidthClass.of(key.currentContext!);
      expect(widthClass, WindowWidthClass.compact);
    });

    testWidgets('width class is medium in 700px media width',
        (WidgetTester tester) async {
      final key = GlobalKey();

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(700, 0)),
          child: SizedBox(key: key),
        ),
      );

      final widthClass = WindowWidthClass.of(key.currentContext!);
      expect(widthClass, WindowWidthClass.medium);
    });

    testWidgets('width class is expanded in 900px media width',
        (WidgetTester tester) async {
      final key = GlobalKey();

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(900, 0)),
          child: SizedBox(key: key),
        ),
      );

      final widthClass = WindowWidthClass.of(key.currentContext!);
      expect(widthClass, WindowWidthClass.expanded);
    });

    testWidgets('width class is large in 1300px media width',
        (WidgetTester tester) async {
      final key = GlobalKey();

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1300, 0)),
          child: SizedBox(key: key),
        ),
      );

      final widthClass = WindowWidthClass.of(key.currentContext!);
      expect(widthClass, WindowWidthClass.large);
    });

    testWidgets('width class is extraLarge in 1700px media width',
        (WidgetTester tester) async {
      final key = GlobalKey();

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1700, 0)),
          child: SizedBox(key: key),
        ),
      );

      final widthClass = WindowWidthClass.of(key.currentContext!);
      expect(widthClass, WindowWidthClass.extraLarge);
    });
  });
}
