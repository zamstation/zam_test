import 'package:test/test.dart';
import 'package:zam_core/zam_core.dart';

import '../test_case/test_case.dart';
import 'multi_cased.test.dart';
import 'single_cased.test.dart';

///
/// [Test] can be seen as the typed version of [test] function
/// from the test package.
///
/// You can wrap multiple [TestCase]s in a [Test].
///
/// Create a new class extending [Test],
/// provide a [name] and a list of [testCases] and you're good to go.
///
/// Example:
///
///     class HeightTest extends Test<double, String> {
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
abstract class Test<INPUT extends Object?, OUTPUT extends Object?>
    implements Initializable<dynamic>, Disposable<dynamic> {
  final String? _name;
  String get name => _name ?? runtimeType.toString();
  String get nameSuffix => ':';
  Iterable<TestCase<INPUT, OUTPUT>> get cases;

  const Test([String? name]) : _name = name;

  factory Test.single({
    String? name,
    required String when,
    required String then,
    required INPUT input,
    required dynamic matcher,
    required ParameterizedCallback<INPUT, OUTPUT> action,
    final String? testOn,
    final Timeout? timeout,
    final dynamic skip,
    final dynamic tags,
    final Map<String, dynamic>? onPlatform,
    final int? retry,
  }) =>
      SingleCasedTest(
        name: name,
        when: when,
        then: then,
        input: input,
        matcher: matcher,
        action: action,
        testOn: testOn,
        timeout: timeout,
        skip: skip,
        tags: tags,
        onPlatform: onPlatform,
        retry: retry,
      );

  factory Test.multi({
    String? name,
    required ParameterizedCallback<INPUT, OUTPUT> action,
    required Iterable<TestCase<INPUT, OUTPUT>> cases,
    Callback<dynamic>? initialize,
    Callback<dynamic>? dispose,
  }) =>
      MultiCasedTest(
        name: name,
        action: action,
        cases: cases,
        initialize: initialize,
        dispose: dispose,
      );

  @override
  dynamic initialize() {}

  OUTPUT run(INPUT input);

  Test<INPUT, OUTPUT> copyWith({
    String? name,
    Callback<dynamic>? initialize,
    Callback<dynamic>? dispose,
  }) {
    return MultiCasedTest<INPUT, OUTPUT>(
      name: name ?? this.name,
      initialize: initialize ?? this.initialize,
      action: this.run,
      dispose: dispose ?? this.dispose,
      cases: this.cases,
    );
  }

  void execute() {
    final description = '$name$nameSuffix';

    group(description, () {
      setUpAll(initialize);
      cases
          .map((testCase) => testCase.copyWith(run))
          .forEach((testCase) => testCase.execute());
      tearDownAll(dispose);
    });
  }

  @override
  dispose() {}
}
