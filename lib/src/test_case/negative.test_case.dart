import 'package:zam_core/zam_core.dart' show ParameterizedCallback;
import 'package:test/test.dart';

import '../matchers/parameterized_type.matcher.dart';
import 'test_case.dart';

///
/// A [TestCase] class that can be used to match exceptions.
/// It uses the [throwsA] matcher.
///
/// Example:
///
///     void main() {
///       NegativeTestCase(
///         when: 'Zero height value',
///         input: 0,
///         exception: HeightNotValidException,
///         action: (double input) => Height(input).toStringInMetre(),
///       ).execute();
///     }
///
class NegativeTestCase<INPUT extends Object?, OUTPUT extends Object?>
    extends TestCase<INPUT, OUTPUT> {
  ///
  /// Exception Type can be provided instead of a custom matcher.
  /// Uses [ParameterizedTypeMatcher] instead of [TypeMatcher]/[isA].
  /// Generated matcher will be 'throwsA(ParameterizedTypeMatcher(exception))'
  ///
  ///     output: HeightNotValidException
  ///
  /// instead of
  ///
  ///     matcher: throwsA(isA<HeightNotValidException>)
  ///
  final Type exception;

  ///
  /// [action] is optional.
  /// Do not provide [action] if the [TestCase] is executed in a [TestGroup].
  /// [then] is defaulted.
  ///
  NegativeTestCase({
    required String when,
    required INPUT input,
    required this.exception,
    ParameterizedCallback<OUTPUT, INPUT>? action,
    String? testOn,
    Timeout? timeout,
    dynamic skip,
    dynamic tags,
    Map<String, dynamic>? onPlatform,
    int? retry,
  }) : super(
          when: when,
          then: 'fails with ${exception}',
          input: input,
          matcher: throwsA(ParameterizedTypeMatcher(exception)),
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
  NegativeTestCase<INPUT, OUTPUT> copyWith(
    ParameterizedCallback<OUTPUT, INPUT> action,
  ) =>
      NegativeTestCase<INPUT, OUTPUT>(
        when: this.when,
        input: this.input,
        exception: this.exception,
        action: action,
        testOn: this.testOn,
        timeout: this.timeout,
        skip: this.skip,
        tags: this.tags,
        onPlatform: this.onPlatform,
        retry: this.retry,
      );

  ///
  /// [execute] is overridden to wrap [action] in a function
  /// so that exception can be caught and matched.
  ///
  @override
  void execute() {
    test(
      description,
      () => expect(
        () => action(input),
        matcher,
      ),
    );
  }
}
