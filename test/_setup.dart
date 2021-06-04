import 'dart:async';

import 'package:test/test.dart';
import 'package:zam_test/zam_test.dart';

class HeightTest extends Test<double, String> {
  @override
  final name = 'Height';

  @override
  run(input) {
    return Height(input).toStringInMetre();
  }

  @override
  final cases = [
    NegativeTestCase(
      when: 'Negative height value',
      input: -23,
      exception: HeightNotValidException,
    ),
    ValueTestCase(
      when: 'Positive Border height value',
      then: 'outputs value in m',
      input: 1,
      output: '0.01 m',
    ),
    TestCase(
      when: 'Positive height value',
      then: 'outputs value in m',
      input: 45,
      matcher: equals('0.45 m'),
    ),
  ];
}

class Height {
  final double value;
  double get valueInMetre => value / 100;

  Height(double value)
      : value = value > 0 ? value : throw HeightNotValidException(value);

  @override
  String toString() {
    return '${value.round()} cm';
  }

  String toStringInMetre() {
    return '${valueInMetre.toStringAsFixed(2)} m';
  }
}

class HeightNotValidException implements Exception {
  final double value;

  const HeightNotValidException(this.value);

  @override
  String toString() {
    return '$runtimeType: $value is an invalid height value. Height should be positive.';
  }
}

///
/// Dirty hack to test if print works.
/// Solution from Stack Overflow.
/// https://stackoverflow.com/questions/14764323/how-do-i-mock-or-verify-a-call-to-print-in-dart-unit-tests/14765018?newreg=1d6b6d56a6b24ab7a7913724072a9be6
///
///
final printLog = [];
void Function() overridePrint(void testFn()) {
  return () {
    final spec = ZoneSpecification(print: (_, __, ___, String msg) {
      // Add to log instead of printing to stdout
      printLog.add(msg);
    });
    return Zone.current.fork(specification: spec).run<void>(testFn);
  };
}
