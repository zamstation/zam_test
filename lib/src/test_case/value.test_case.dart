import 'package:zam_core/zam_core.dart' show ParameterizedCallback;
import 'package:test/test.dart';

import 'test_case.dart';

///
/// A [TestCase] class that can be used to compare flat output values.
/// It uses the [equals] matcher.
///
/// Example:
///
///     void main() {
///       ValueTestCase(
///         when: 'Positive Border height value',
///         then: 'outputs value in m',
///         input: 1.0,
///         output: '0.01 m',
///         action: (double input) => Height(input).toStringInMetre(),
///       ).execute();
///     }
///
class ValueTestCase<INPUT extends Object?, OUTPUT extends Object?>
    extends TestCase<INPUT, OUTPUT> {
  ///
  /// A simple output value can be provided instead of a custom matcher.
  /// Generated matcher will be 'equals(output)'
  ///
  ///     output: '0.01 m'
  ///
  /// instead of
  ///
  ///     matcher: equals('0.01 m')
  ///
  final OUTPUT output;

  ///
  /// [action] is optional.
  /// Do not provide [action] if the [TestCase] is executed in a [TestGroup].
  ///
  ValueTestCase({
    required String when,
    required String then,
    required INPUT input,
    required this.output,
    ParameterizedCallback<INPUT, OUTPUT>? action,
    String? testOn,
    Timeout? timeout,
    dynamic skip,
    dynamic tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) : super(
          when: when,
          then: then,
          input: input,
          matcher: equals(output),
          action: action,
          testOn: testOn,
          timeout: timeout,
          skip: skip,
          tags: tags,
          onPlatform: onPlatform,
          retry: retry,
        );

  ///
  /// [copyWith] is used internally by the [TestGroup].
  ///
  @override
  ValueTestCase<INPUT, OUTPUT> copyWith(action) {
    return ValueTestCase<INPUT, OUTPUT>(
      when: this.when,
      then: this.then,
      input: this.input,
      output: this.output,
      action: action,
      testOn: this.testOn,
      timeout: this.timeout,
      skip: this.skip,
      tags: this.tags,
      onPlatform: this.onPlatform,
      retry: this.retry,
    );
  }
}
