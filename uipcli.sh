#!/bin/bash

if [[ -n "$CI" ]]; then
  echo "Running inside GL pipeline"
  exec /bin/bash
else
  echo "Running locally"
  exec dotnet "$UIPATH_CLI_WORKING_DIR"/uipcli.dll "$@"
fi
