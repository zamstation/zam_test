import 'package:zam_core/zam_core.dart' show ParameterizedCallback;
import 'package:test/test.dart';

///
/// TestCase can be seen as the typed version of [test] function from the test package.
///
/// Example:
///
///     void main() {
///       TestCase(
///         when: 'Positive Border height value',
///         then: 'outputs value in m',
///         input: 1.0,
///         matcher: equals('0.01 m'),
///         action: (double input) => Height(input).toStringInMetre(),
///       ).execute();
///     }
///
class TestCase<INPUT extends Object?, OUTPUT extends Object?> {
  ///
  /// 'when' part of the [description].
  ///
  /// Example:
  ///
  ///     when: 'Positive Border height value'
  ///
  final String when;

  ///
  /// 'then' part of the [description].
  ///
  /// Example:
  ///
  ///     then: 'outputs value in m'
  ///
  final String then;

  ///
  /// [descriptionDelimiter] is defaulted to this class.
  /// You can extend this class and override this field.
  ///
  final String descriptionDelimiter = ' -> ';

  ///
  /// You can extend this class and override this field.
  ///
  /// Example:
  ///
  ///     when: 'Positive Border height value'
  ///     then: 'outputs value in m'
  ///     description: 'Positive Border height value -> outputs value in m'
  ///
  String get description => when + descriptionDelimiter + then;

  ///
  /// Input value for the test case. The type is provided as a generic.
  ///
  final INPUT input;

  ///
  /// Custom output matcher for the test case.
  /// Sent as such to the [test] function.
  ///
  final dynamic matcher;

  ///
  /// Provided only if the [TestCase] is executed without a [TestGroup].
  /// If [TestGroup] is provided, the common [action] is run by just varying the input.
  ///
  final ParameterizedCallback<OUTPUT?, INPUT> action;

  ///
  /// Direct forward to [test] function
  ///
  final String? testOn;

  ///
  /// Direct forward to [test] function
  ///
  final Timeout? timeout;

  ///
  /// Direct forward to [test] function
  ///
  final dynamic skip;

  ///
  /// Direct forward to [test] function
  ///
  final dynamic tags;

  ///
  /// Direct forward to [test] function
  ///
  final Map<String, dynamic>? onPlatform;

  ///
  /// Direct forward to [test] function
  ///
  final int? retry;

  ///
  /// [action] is optional.
  /// Do not provide [action] if the [TestCase] is executed in a [TestGroup].
  ///
  TestCase({
    required this.when,
    required this.then,
    required this.input,
    required this.matcher,
    ParameterizedCallback<OUTPUT, INPUT>? action,
    this.testOn,
    this.timeout,
    this.skip,
    this.tags,
    this.onPlatform,
    this.retry,
  }) : action = action ?? ((INPUT input) => null);

  ///
  /// [copyWith] is used internally by the [TestGroup].
  ///
  TestCase<INPUT, OUTPUT> copyWith(
    ParameterizedCallback<OUTPUT, INPUT> action,
  ) {
    return TestCase<INPUT, OUTPUT>(
      when: this.when,
      then: this.then,
      input: this.input,
      matcher: this.matcher,
      action: action,
      testOn: this.testOn,
      timeout: this.timeout,
      skip: this.skip,
      tags: this.tags,
      onPlatform: this.onPlatform,
      retry: this.retry,
    );
  }

  ///
  /// Wrapper to the [test] function.
  ///
  void execute() {
    test(
      description,
      () => expect(
        action(input),
        matcher,
      ),
      testOn: this.testOn,
      timeout: this.timeout,
      skip: this.skip,
      tags: this.tags,
      onPlatform: this.onPlatform,
      retry: this.retry,
    );
  }
}
