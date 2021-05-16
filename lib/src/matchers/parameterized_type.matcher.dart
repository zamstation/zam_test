import 'package:test/test.dart';

///
/// This is created to address the problem in [TypeMatcher]/[isA].
/// [TypeMatcher] does not accept a type parameter. Instead it accepts type as a generic.
///
class ParameterizedTypeMatcher extends Matcher {
  final Type type;

  const ParameterizedTypeMatcher(this.type);

  @override
  describe(description) {
    return description.add(type.toString());
  }

  @override
  matches(item, matchState) {
    return item.runtimeType == type;
  }
}
