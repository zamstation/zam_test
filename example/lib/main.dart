import 'package:zam_test/utilities.dart';
import 'package:zam_test/zam_test.dart';

/// [TestRun] is used to run multiple [TestGroup] together.
void main() {
  TestRun('All Tests', [
    HeightTest(),
    // ...
    // ...
    // ... (you can add more test groups here)
  ]).execute();

  // Alternatively, you can write as follows.
  // HeightTest().execute();
  // But [TestRun] will help you when you have many [TestGroup]s.
}

/// Create a class extending [TestGroup].
/// Provide a [name].
/// You can optionally override the [nameSuffix] and the [description].
/// Override [setUp] and [tearDown] when required.
/// Override [run] which is a function called for every [TestCase].
/// Provide a list of [testCases].
class HeightTest extends TestGroup<double, String> {
  @override
  final name = 'Height';

  /// Runs once before the first [TestCase] is run.
  /// [sleep] is an utility function in this package.
  @override
  setUp() async {
    await sleep(seconds: 1);
  }

  /// This function is run for every [TestCase].
  @override
  run(input) {
    return Height(input).toStringInMetre();
  }

  /// Runs once after the last [TestCase] is run.
  /// [shutdown] is an utility function in this package.
  @override
  tearDown() async {
    await shutdown(seconds: 1);
  }

  /// Provide all the [TestCase]s here in an array.
  ///
  /// Here are the different types of test cases.
  ///   [TestCase] - Base class which expects an input and a matcher.
  ///   [ValueTestCase] - Expects an input and an output.
  ///   [NegativeTestCase] - Expects an input and an exception type.
  @override
  final testCases = [
    NegativeTestCase(
      when: 'Negative height value',
      input: -23,
      exception: HeightNotValidException,
    ),
    NegativeTestCase(
      when: 'Negative Border height value',
      input: -1,
      exception: HeightNotValidException,
    ),
    NegativeTestCase(
      when: 'Zero height value',
      input: 0,
      exception: HeightNotValidException,
    ),
    ValueTestCase(
      when: 'Positive Border height value',
      then: 'outputs value in m',
      input: 1,
      output: '0.01 m',
    ),
    ValueTestCase(
      when: 'Positive height value',
      then: 'outputs value in m',
      input: 45,
      output: '0.45 m',
    ),
    ValueTestCase(
      when: 'Positive Extreme height value',
      then: 'outputs value in m',
      input: 834,
      output: '8.34 m',
    ),
  ];
}

class Height {
  final double value;
  double get valueInMetre => value / 100;

  Height(double value) : value = value > 0 ? value : throw HeightNotValidException(value);

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
