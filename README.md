# UiPath CLI
The purpose of this Docker image is to provide the ability to run the UiPath Command Line Interface (UiPath CLI).

One such use case is to be able to execute test sets from a GitLab CI / CD pipeline.

See the following UiPath documentation links for more information on the CLI usage: 
* [CLI Tasks](https://docs.uipath.com/test-suite/automation-suite/2022.10/user-guide/cli-tasks)
* [Executing Tasks](https://docs.uipath.com/test-suite/automation-suite/2022.10/user-guide/executing-tasks-cli)

# Supported Tags and respective Dockerfile links
* [`23.2.8467.25277`, `latest`](https://github.com/BP3/uipcli/blob/23.2.8467.25277/Dockerfile)

# Usage
To get more help on the available verbs (actions) and the CLI version, use the following command:
```shell
docker run bp3global/uipcli /uipcli.sh
```

To get help on a specific verb (action), for example, running test sets, use the following command:
```shell
docker run bp3global/uipcli /uipcli.sh test
```
