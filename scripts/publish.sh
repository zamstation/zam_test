#-----------------------------------------------------------------------------
#
#		publish.sh
#
#		Script that publishes the package to pub.dev
#
#		Before publishing it
#			- Gets dependencies
#			- Formats Code
#			- Runs dart analyze
#			- Runs tests and collects coverage
#
#		Arguments:
#			1. env -> should be prod or test
#
#-----------------------------------------------------------------------------

# Parse arguments
env='test'
if [[ $1 == 'prod' ]]; then
	env='prod'
fi

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

# Publish
if [[ $env == 'test' ]]; then
	echo 'Dry running dart pub publish'
	dart pub publish --dry-run
else
	echo 'Publishing package to pub.dev'
	dart pub publish
fi

# End
exit 0

#-----------------------------------------------------------------------------
