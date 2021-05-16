# Abort if there is an error.
set -e

# Get Packages
dart pub get

# Format Code
dart format --set-exit-if-changed .

# Run Dart Analyze
dart analyze --fatal-infos --fatal-warnings .

# Run Tests and Collect Coverage
flutter test --no-pub --coverage
