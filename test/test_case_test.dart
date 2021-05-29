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
      action: (double input) => Height(input).toStringInMetre(),
    );

    test(
        'When copied with a new action, all other fields should remain the same.',
        () {
      expect(testCase.when, 'Positive Border height value');
      expect(testCase.then, 'outputs value in m');
      expect(testCase.input, 1);
    });

    test('Description should be built using when and then.', () {
      expect(testCase.description,
          'Positive Border height value -> outputs value in m');
    });
  });
}
