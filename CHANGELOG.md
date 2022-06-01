# 0.5.0
- Dependency Updates:
	- `flutter 3.0.0`
	- `dart 2.17.0`
	- `zam_core 0.7.0`
	- `lints 2.0.0`
	- `test 1.21.1`

# 0.4.0
- Dependency Updates: `zam_core 0.6.0`

# 0.3.0
- Modified `zam_test.dart` to export original test library.
- Dependency Updates:
	- `dart 2.13.0`
	- `zam_core 0.5.0`
	- `test 1.17.8`

# 0.2.0
- Added `BooleanTestCase`.

# 0.1.0
- Added new classes `Test`, `SingleCasedTest` and `MultiCasedTest`. Use `Test` as the main class instead of `TestCase` and `TestGroup`.
- Removed `TestRun`. Use `TestGroup` instead.
- Modified `TestCase` to make its action field optional.

# 0.0.2
- Dependency Updates: `zam_core 0.1.1`
- Fixes due to Dependency Updates: Fixed order of generics in callbacks.

# 0.0.1
- Includes the core classes `TestCase`, `TestGroup` and `TestRun`.
- Includes `ValueTestCase` for straight value matches.
- Includes `NegativeTestCase` for exception matches.
- Includes `ParameterizedTypeMatcher`.
- Includes utilities `sleep` and `shutDown`.
