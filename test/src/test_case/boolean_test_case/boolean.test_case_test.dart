import 'package:zam_test/zam_test.dart';

import '../../_setup.dart';

void main() {
  group('BooleanTestCase: ', () {
    final truthyTestCase = BooleanTestCase.truthy(
      when: 'Positive Border height value',
      input: 1.0,
      action: (double input) => Height.canCreate(input),
    );
    truthyTestCase.execute();

    final falsyTestCase = BooleanTestCase.falsy(
      when: 'Negative height value',
      input: -22.0,
      action: (double input) => Height.canCreate(input),
    );
    falsyTestCase.execute();

    test(
        'When truthy testy case is constructed, defaults are set successfully.',
        () {
      expect(truthyTestCase.then, 'should return true.');
      expect(truthyTestCase.output, true);
    });

    test('When falsy testy case is constructed, defaults are set successfully.',
        () {
      expect(falsyTestCase.then, 'should return false.');
      expect(falsyTestCase.output, false);
    });
  });
}
