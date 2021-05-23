import 'package:test/test.dart';

import '../test_case/test_case.dart';

///
/// [TestGroup] is synonymous to [group] function.
/// You can wrap multiple [TestCase]s in a [TestGroup].
/// Create a new class extending [TestGroup],
/// provide a [name] and a list of [testCases] and you're good to go.
///
/// Example:
///
///     class HeightTest extends TestGroup<double, String> {
///       @override
///       final name = 'Height';
///
///       @override
///       run(input) {
///         return Height(input).toStringInMetre();
///       }
///
///       @override
///       final testCases = [
///         NegativeTestCase(
///           when: 'Negative Border height value',
///           input: -1,
///           exception: HeightNotValidException,
///         ),
///         NegativeTestCase(
///           when: 'Zero height value',
///           input: 0,
///           exception: HeightNotValidException,
///         ),
///         ValueTestCase(
///           when: 'Positive Border height value',
///           then: 'outputs value in m',
///           input: 1,
///           output: '0.01 m',
///         ),
///       ];
///     }
///
abstract class TestGroup<INPUT extends Object?, OUTPUT extends Object?> {
  String get name;

  ///
  /// [nameSuffix] is defaulted to this class.
  /// Override this field to provide your own suffix.
  ///
  final String nameSuffix = ':';

  ///
  /// Override this field if you're not happy with the built string.
  ///
  String get description => name + nameSuffix;
  Iterable<TestCase<INPUT, OUTPUT>> get testCases;

  ///
  /// Runs once before the first [TestCase] is run.
  ///
  dynamic setUp() {}

  ///
  /// Runs for every [TestCase].
  ///
  OUTPUT run(INPUT input);

  ///
  /// Runs once after the last [TestCase] is run.
  ///
  dynamic tearDown() {}

  void execute() {
    setUpAll(setUp);

    group(description, () {
      testCases
          .map((testCase) => testCase.copyWith(run))
          .forEach((testCase) => testCase.execute());
    });

    tearDownAll(tearDown);
  }
}
