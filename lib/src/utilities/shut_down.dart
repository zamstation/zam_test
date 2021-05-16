import 'sleep.dart';

///
/// Utility function to wait for any [Future] to complete before shutting down.
/// It is a clone of [sleep] for now.
///
Future shutdown({
  int seconds = 1,
  bool debug = false,
}) async {
  if (debug) print('\n----        SHUTTING DOWN        ----\n');
  await sleep(seconds: seconds);
  if (debug) print('\n----          SHUT DOWN          ----\n');
}
