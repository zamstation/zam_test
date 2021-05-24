#!/bin/bash
#-----------------------------------------------------------------------------
#
#		validate.sh
#
#		Script that validates the package.
#
#		What it does:
#			- Gets dependencies
#			- Formats Code
#			- Runs dart analyze
#			- Runs tests and collects coverage
#
#		Arguments:
#			<none>
#
#-----------------------------------------------------------------------------

# Abort if there is an error.
set -e

# Get dependencies
dart pub get

# Format code
dart format --set-exit-if-changed .

# Run dart analyze
dart analyze --fatal-infos --fatal-warnings .

# Run tests and collect coverage
flutter test --no-pub --coverage

# End
exit 0

#-----------------------------------------------------------------------------
