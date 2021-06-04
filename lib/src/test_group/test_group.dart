import 'package:test/test.dart';
import 'package:zam_core/zam_core.dart';

import '../test/test.dart';

///
/// [TestGroup] is synonymous to [group] function.
/// You can wrap multiple [Test]s in a [TestGroup].
///
/// Example:
///
///     TestGroup('BMI', [
///       HeightTest(),
///     ]).execute();
///
class TestGroup implements Initializable<dynamic>, Disposable<dynamic> {
  ///
  /// Used in building description.
  ///
  final String name;

  ///
  /// Used in building description.
  ///
  final String nameSuffix;

  ///
  /// Built from name and nameSuffix.
  ///
  String get description => name == '' ? '' : '$name$nameSuffix';

  ///
  /// List of tests to be run with in this group.
  ///
  final List<Test> tests;

  const TestGroup(
    this.name,
    this.tests, {
    this.nameSuffix = ' -',
  });

  ///
  /// Call this constructor when you extend [TestGroup].
  ///
  const TestGroup.empty()
      : name = '',
        nameSuffix = ' -',
        tests = const [];

  ///
  /// Runs once for every [TestGroup].
  ///
  @override
  dynamic initialize() {}

  ///
  /// Runs once for every [TestGroup].
  ///
  @override
  dynamic dispose() {}

  ///
  /// Runs for every [Test].
  ///
  dynamic initializeForEveryTest() {}

  ///
  /// Runs for every [Test].
  ///
  dynamic disposeForEveryTest() {}

  void execute() {
    group(description, () {
      setUpAll(initialize);

      tests
          .map((test) => test.copyWith(
                initialize: () {
                  initializeForEveryTest();
                  return test.initialize();
                },
                dispose: () {
                  disposeForEveryTest();
                  return test.dispose();
                },
              ))
          .forEach((test) => test.execute());

      tearDownAll(dispose);
    });
  }
}
