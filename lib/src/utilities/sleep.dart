///
/// Utility function to wait for any [Future] to complete.
///

Future sleep({
  int seconds = 1,
  bool debug = false,
}) async {
  if (debug) print('\n....   Sleeping for $seconds second(s)    ....\n');
  await Future.delayed(Duration(seconds: seconds));
  if (debug) print('\n....           Woke up!          ....\n');
}
