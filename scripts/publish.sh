#!/bin/bash
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
scriptDirectory=`dirname "$0"`
env='test'
if [[ $1 == 'prod' ]]; then
	env='prod'
fi

# Abort if there is an error.
set -e

# Validate package
sh $scriptDirectory/validate.sh

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
