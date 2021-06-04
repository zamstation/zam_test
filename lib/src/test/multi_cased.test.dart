import 'package:zam_core/zam_core.dart';

import '../test_case/test_case.dart';
import 'test.dart';

class MultiCasedTest<INPUT extends Object?, OUTPUT extends Object?>
    extends Test<INPUT, OUTPUT> {
  final Callback<dynamic> _initialize;
  final ParameterizedCallback<INPUT, OUTPUT> _action;
  final Callback<dynamic> _dispose;
  @override
  final Iterable<TestCase<INPUT, OUTPUT>> cases;

  MultiCasedTest({
    String? name,
    required ParameterizedCallback<INPUT, OUTPUT> action,
    required this.cases,
    Callback<dynamic>? initialize,
    Callback<dynamic>? dispose,
  })  : _action = action,
        _initialize = initialize ?? (() {}),
        _dispose = dispose ?? (() {}),
        super(name);

  @override
  dynamic initialize() => _initialize();

  @override
  run(input) => _action(input);

  @override
  dynamic dispose() => _dispose();
}
