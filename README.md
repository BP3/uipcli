# UiPath CLI
The purpose of this Docker image is to provide the ability to run the UiPath Command Line Interface (UiPath CLI).
(The base image is the latest version of dotnet 6 SDK - the only version of dotnet that UiPath has tested against at this time.)

See the following UiPath documentation links for more information on the CLI usage: 
* [CLI Tasks](https://docs.uipath.com/test-suite/automation-suite/2022.10/user-guide/cli-tasks)
* [Executing Tasks](https://docs.uipath.com/test-suite/automation-suite/2022.10/user-guide/executing-tasks-cli)

## Supported Tags and respective Dockerfile links
* [`23.2.8467.25277`, `latest`](https://github.com/BP3/uipcli/blob/23.2.8467.25277/Dockerfile)

## Usage
To get more help on the available verbs (actions) and the CLI version, use the following command:
```shell
docker run bp3global/uipcli /uipcli.sh [help]
```

To get help on a specific verb (action), for example, running test sets, use the following command:
```shell
docker run bp3global/uipcli /uipcli.sh test
```

## Note on Vulnerabilities
The vulnerability scan automatically performed by DockerHub when this image is built does report a number of 
vulnerabilities.
Further investigation reveals that these vulnerabilities exist in (are introduced by) the underlying 
[.NET SDK v6 image](https://mcr.microsoft.com/en-us/product/dotnet/sdk/about) from Microsoft.
As such BP3 takes no responsibility for the fact that these vulnerabilities exist in this image. If you are not happy with these 
vulnerabilities then your choices are

1. Report your concerns to Microsoft as the producer of the upstream image
2. Produce your own image

With that said you may also wish to consider what risk these vulnerabilities actually present. 
There is a big difference using this image for a server on the public internet versus its intended use
to execute a single command as part of a GitLab pipeline. You may feel that you can accept the risk.
