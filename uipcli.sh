#!/bin/bash

if [[ -n "$CI" ]]; then
  exec /bin/bash
else
  exec dotnet "$UIPATH_CLI_WORKING_DIR"/uipcli.dll "$@"
fi
