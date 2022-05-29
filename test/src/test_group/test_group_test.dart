import 'package:zam_test/zam_test.dart';

import '../_setup.dart';

void main() {
  group('TestRun: ', () {
    final testGroup = TestGroup('All Tests', [
      HeightTest(),
    ]);
    test('Object is created successfully.', () {
      expect(testGroup.tests.length, 1);
    });

    // You cannot run a test inside a test. Hence the hack.
    testGroup.execute();
    test('Execute method should return normally.', () {
      expect(() => null, returnsNormally);
    });
  });
}
