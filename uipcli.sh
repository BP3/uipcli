#!/bin/bash

echo "Before shifting by 3"
echo "$1"
echo "$2"
echo "$3"
echo "$@"

if [ "$1" = "sh" -a "$2" = "-c" ]; then
  shift 3
elif [ "$1" = "bash" -a "$2" = "-c" ]; then
  shift 3
fi

#exec dotnet "$UIPATH_CLI_WORKING_DIR"/uipcli.dll "$@"
