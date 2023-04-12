#!/bin/bash

#echo "Before shifting by 3"
#echo "$@"
#
#if [ "$1" = "sh" -a "$2" = "-c" ]; then
#  shift 3
#elif [ "$1" = "bash" -a "$2" = "-c" ]; then
#  shift 3
#fi
#
#echo "After shifting by 3"
#echo "$@"
#
#exec dotnet "$UIPATH_CLI_WORKING_DIR"/uipcli.dll "$@"

if [[ -n "$CI" ]]; then
  echo "Params when running inside GL"
  echo "$@"

  exec /bin/bash
# Otherwise we are running out side, so execute the command line wrapper script directly
else
  echo "Params when running locally"
  echo "$@"

  exec dotnet "$UIPATH_CLI_WORKING_DIR"/uipcli.dll "$@"
fi
