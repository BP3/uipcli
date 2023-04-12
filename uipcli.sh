#!/bin/bash

# This script has to handle being called locally or from a GitLab CI / CD pipeline.
# The requirements are stipulated here (although provides no real examples):
#   https://docs.gitlab.com/runner/executors/docker.html#configure-a-docker-entrypoint
# Further more, this link shows an example based on those requirements which this script is based upon:
#   https://stackoverflow.com/questions/70401876/gitlab-runner-doesnt-run-entrypoint-scripts-in-dockerfile

# The CI variable is boolean that is set to true of we are running in a GitLab or GitHub CI / CD environment
# so we execute a bash shell where the script block commands are piped into. Note that the 'CI' variable
# is a standard convention used for many CI / CD environments so this should be compatible.
if [[ -n "$CI" ]]; then
    exec /bin/bash
# Otherwise we are running outside of a CI / CD environment, so execute the command line wrapper script directly
else
    # We are shifting because we want users to be consistent in its use and specify the '/uipcli.sh' script
    # that needs to be specified if running in a CI / CD environment, which will appear as
    # the first parameter passed into this script
    shift
    exec dotnet "$UIPATH_CLI_WORKING_DIR"/uipcli.dll "$@"
fi
