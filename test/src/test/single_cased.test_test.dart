import 'package:zam_test/zam_test.dart';

import '../_setup.dart';

void main() {
  group('Single Cased Test: ', () {
    final singleCasedTest = Test.single(
      when: 'Positive Border height value',
      then: 'outputs value in m',
      input: 1.0,
      matcher: equals('0.01 m'),
      action: (double input) => Height(input).toStringInMetre(),
    );

    test('When test is created and run, the provided action is run.', () {
      expect(singleCasedTest.run(1.0), '0.01 m');
    });
  });
}
