import 'package:zam_test/utilities.dart';
import 'package:zam_test/zam_test.dart';

///
/// [TestGroup] is used to run multiple [Test] together.
///
void main() {
  TestGroup('BMI', [
    HeightTest(),
    HeightCanCreateTest(),
    // ...
    // ...
    // ... (you can add more tests here)
  ]).execute();

  // Alternatively, you can write as follows.
  // HeightTest().execute();
  // But [TestGroup] will help you when you have many [Test]s.
}

///
/// Create a class extending [Test].
/// Provide a [name]. (If not, defaults to class name. In this case, it is 'HeightTest')
/// You can optionally override the [nameSuffix] and the [description].
/// Override [initialize] and [dispose] when required.
/// Override [run] which is a function called for every [TestCase].
/// Provide a list of [testCases].
///
class HeightTest extends Test<double, String> {
  @override
  final name = 'Height';

  /// Runs once before the first [TestCase] is run.
  /// [sleep] is an utility function in this package.
  @override
  initialize() async {
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
  dispose() async {
    await shutdown(seconds: 1);
  }

  /// Provide all the [TestCase]s here in an array.
  ///
  /// Here are the different types of test cases.
  ///   [TestCase] - Base class which expects an input and a matcher.
  ///   [ValueTestCase] - Expects an input and an output.
  ///   [NegativeTestCase] - Expects an input and an exception type.
  ///   [BooleanTestCase] - Expects an input and output is set based on constructor.
  @override
  final cases = [
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

class HeightCanCreateTest extends Test<double, bool> {
  @override
  bool run(double input) {
    return Height.canCreate(input);
  }

  @override
  final cases = [
    BooleanTestCase.truthy(
      when: 'Positive height value',
      input: 45,
    ),
    BooleanTestCase.falsy(
      when: 'Negative height value',
      input: -22,
    ),
  ];
}

class Height {
  final double value;
  double get valueInMetre => value / 100;

  static bool canCreate(double value) => value > 0;

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
