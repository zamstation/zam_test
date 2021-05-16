import 'package:test/test.dart';
import 'package:zam_test/utilities.dart';

import '_setup.dart';

void main() {
  group('sleep: ', () {
    test('When debug is set to false, It should not print anything', overridePrint(() async {
      await sleep(debug: false);
      expect(printLog.length, 0);
    }));
    test('When debug is set to true, It should print', overridePrint(() async {
      await sleep(debug: true);
      expect(printLog.length, 2);
    }));
  });
}
