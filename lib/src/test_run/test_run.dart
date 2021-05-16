import '../test_group/test_group.dart';

///
/// [TestRun] is used to run multiple [TestGroup]s together.
/// It is more of a utility class. You can run test groups without this.
///
/// Example:
///
/// void main() {
///   TestRun('All Tests', [
///     HeightTest(),
///     WeightTest(),
///     BmiTest(),
///   ]).execute();
/// }
///
/// Example without TestRun:
///
/// void main() {
///     HeightTest().execute();
///     WeightTest().execute();
///     BmiTest().execute();
/// }
///
class TestRun {
  final String name;
  final Iterable<TestGroup> testGroups;

  TestRun(this.name, this.testGroups);

  void execute() {
    testGroups.forEach((testGroup) => testGroup.execute());
  }
}
