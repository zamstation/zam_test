# 0.4.0
- Updated dependency: zam_core 0.6.0

# 0.3.0
- Modified `zam_test.dart` to export original test library.
- Updated dependency: zam_core 0.5.0
- Updated dependency: test 1.17.8
- Updated dependency: dart sdk ">=2.13.0 <3.0.0"

# 0.2.0
- Added `BooleanTestCase`.

# 0.1.0
- Added new classes `Test`, `SingleCasedTest` and `MultiCasedTest`. Use `Test` as the main class instead of `TestCase` and `TestGroup`.
- Removed `TestRun`. Use `TestGroup` instead.
- Modified `TestCase` to make its action field optional.

# 0.0.2

- Updated dependency: zam_core 0.1.1
- Fixed order of generics in callbacks due to zam_core 0.1.1.

# 0.0.1

- Includes the core classes `TestCase`, `TestGroup` and `TestRun`.
- Includes `ValueTestCase` for straight value matches.
- Includes `NegativeTestCase` for exception matches.
- Includes `ParameterizedTypeMatcher`.
- Includes utilities `sleep` and `shutDown`.
