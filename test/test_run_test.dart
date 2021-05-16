import 'package:test/test.dart';
import 'package:zam_test/zam_test.dart';

import '_setup.dart';

void main() {
  group('TestRun: ', () {
    final testRun = TestRun('All Tests', [
      HeightTest(),
    ]);
    test('Object is created successfully.', () {
      expect(testRun.testGroups.length, 1);
    });

    // You cannot run a test inside a test. Hence the hack.
    testRun.execute();
    test('Execute method should return normally.', () {
      expect(() => null, returnsNormally);
    });
  });
}
