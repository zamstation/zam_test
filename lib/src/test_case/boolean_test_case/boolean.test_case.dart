import 'package:test/test.dart';
import 'package:zam_core/zam_core.dart';

import '../test_case.dart';
import '../value_test_case/value.test_case.dart';

///
/// A [TestCase] class that can be used to compare boolean values.
/// It uses the [equals] matcher.
///
/// Example:
///
///     void main() {
///       BooleanTestCase.truthy(
///         when: 'When upper case text is provided',
///         input: 'HELLO',
///         action: (String input) => input.isUpperCase(),
///       ).execute();
///     }
///
class BooleanTestCase<INPUT extends Object?>
    extends ValueTestCase<INPUT, bool> {
  ///
  /// [action] is optional.
  /// Do not provide [action] if the [TestCase] is executed in a [TestGroup].
  ///
  BooleanTestCase.truthy({
    required String when,
    String then = 'should return true.',
    required INPUT input,
    ParameterizedCallback<INPUT, bool>? action,
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
          output: true,
          action: action,
          testOn: testOn,
          timeout: timeout,
          skip: skip,
          tags: tags,
          onPlatform: onPlatform,
          retry: retry,
        );

  ///
  /// [action] is optional.
  /// Do not provide [action] if the [TestCase] is executed in a [TestGroup].
  ///
  BooleanTestCase.falsy({
    required String when,
    String then = 'should return false.',
    required INPUT input,
    ParameterizedCallback<INPUT, bool>? action,
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
          output: false,
          action: action,
          testOn: testOn,
          timeout: timeout,
          skip: skip,
          tags: tags,
          onPlatform: onPlatform,
          retry: retry,
        );
}
