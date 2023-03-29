# UiPath CLI
The purpose of this Docker image is to provide the ability to run the UiPath Command Line Interface (UiPath CLI), without the need to install or configure the CLI locally.

It allows you to execute various robot functions such as running jobs or test sets within UiPath Orchestrator.

One such use case is to be able to execute test sets from a CI / CD pipeline.

# Usage
To execute the CLI, for example, which runs test set in the UiPath Orchestrator, use the following command:

```shell
docker run bp3global/uipcli /uipathcli.sh test run \
    "https://cloud.uipath.com" \
    "<UIPath tenant name>" \
    -A "<UIPath account name>" \
    -I "<UIPath external application client Id>" \
    -S "<UIPath external application client secret>" \
    -s "<Name of the Test Set to execute>" \
    -o "<Name of the folder where the Test Set resides>" \
    --applicationScope "<UIPath external application 'application' scopes>"
```

This will provide the following example output:
```shell
Running tests in set MyTestSet on https://cloud.uipath.com (tenant MyTenant) with a timeout of 7200 seconds...
Starting test set run for MyTestSet...
Started test set MyTestSet with execution id 123456.
Running tests... 0 passed, 0 failed or canceled, 2 total. Waiting for 20s.
Running tests... 1 passed, 0 failed or canceled, 1 total. Waiting for 20s.
Finished running test set MyTestSet...
Writing test results of type uipath to /uipath/uipath.cli/23.2.8467.25277/tools/MyTestSet.json...
```

To get more help on the available verbs (actions), use the following command:
```shell
docker run bp3global/uipcli /uipcli.sh
```

To get help on a specific verb (action), for example, running test sets, use the following command:
```shell
docker run bp3global/uipcli /uipcli.sh test
```

# Image Variants
There are two variants available.

## `bp3global/uipcli:latest`
This runs the latest version and will be associated with the latest UiPath CLI version that an image has been built against.

## `bp3global/uipcli:<version>`
This runs a container for the UiPath CLI version the image was built against, for example `bp3global/uipcli:23.2.8467.25277`.