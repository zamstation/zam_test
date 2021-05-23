import 'package:test/test.dart';
import 'package:zam_test/zam_test.dart';

import '_setup.dart';

void main() {
  final matcher = ParameterizedTypeMatcher(HeightNotValidException);
  group('ParameterizedTypeMatcher: ', () {
    test('Constructor works.', () {
      expect(matcher.type, HeightNotValidException);
    });
    test(
        'When describe method is called with an empty description, the given type is appended to it.',
        () {
      expect(matcher.describe(StringDescription()).toString(),
          'HeightNotValidException');
    });
    test('When matches method is called with a matching output, returns true.',
        () {
      expect(matcher.matches(HeightNotValidException(162), {}), true);
    });
    test(
        'When matches method is called with a non-matching output, returns false.',
        () {
      expect(matcher.matches(Object, {}), false);
    });
  });
}
