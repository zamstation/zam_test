import 'package:test/test.dart';
import 'package:zam_test/zam_test.dart';

import '_setup.dart';

void main() {
  group('TestCase: ', () {
    final testCase = TestCase(
      when: 'Positive Border height value',
      then: 'outputs value in m',
      input: 1.0,
      matcher: equals('0.01 m'),
    );

    test('When action is not provided to the TestCase, It should be defaulted to null returning dummy function.', () {
      expect(testCase.action(1), null);
    });

    final newTestCase = testCase.copyWith((double input) => Height(input).toStringInMetre());
    test('When copied with a new action, all other fields should remain the same.', () {
      expect(newTestCase.when, 'Positive Border height value');
      expect(newTestCase.then, 'outputs value in m');
      expect(newTestCase.input, 1);
    });

    test('Description should be built using when and then.', () {
      expect(testCase.description, 'Positive Border height value -> outputs value in m');
    });
  });
}
