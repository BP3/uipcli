#!/bin/bash

if [ "$1" = "sh" -a "$2" = "-c" ]; then
  shift 2
elif [ "$1" = "bash" -a "$2" = "-c" ]; then
  shift 2
fi

exec dotnet "$UIPATH_CLI_WORKING_DIR"/uipcli.dll "$@"
