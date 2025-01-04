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
}
