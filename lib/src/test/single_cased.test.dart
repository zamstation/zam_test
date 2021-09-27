import 'package:test/test.dart';
import 'package:zam_core/zam_core.dart';

import '../test_case/test_case.dart';
import 'test.dart';

class SingleCasedTest<INPUT extends Object?, OUTPUT extends Object?>
    extends Test<INPUT, OUTPUT> {
  final ParameterizedCallback<INPUT, OUTPUT> action;
  @override
  final Iterable<TestCase<INPUT, OUTPUT>> cases;

  SingleCasedTest({
    String? name,
    required String when,
    required String then,
    required INPUT input,
    required dynamic matcher,
    required this.action,
    final String? testOn,
    final Timeout? timeout,
    final dynamic skip,
    final dynamic tags,
    final Map<String, dynamic>? onPlatform,
    final int? retry,
  })  : cases = [
          TestCase(
            when: when,
            then: then,
            input: input,
            matcher: matcher,
            testOn: testOn,
            timeout: timeout,
            skip: skip,
            tags: tags,
            onPlatform: onPlatform,
            retry: retry,
          )
        ],
        super(name);

  @override
  @protected
  run(input) => action(input);
}
