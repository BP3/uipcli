#!/bin/bash

echo "Before shifting by 3"
echo "$@"

if [ "$1" = "sh" -a "$2" = "-c" ]; then
  shift 3
elif [ "$1" = "bash" -a "$2" = "-c" ]; then
  shift 3
fi

echo "After shifting by 3"
echo "$@"

#exec dotnet "$UIPATH_CLI_WORKING_DIR"/uipcli.dll "$@"
