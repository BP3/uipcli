FROM mcr.microsoft.com/dotnet/sdk:6.0

ARG UIPATH_CLI_VERSION
ENV UIPATH_CLI_VERSION=${UIPATH_CLI_VERSION:-23.2.8467.25277}
ENV UIPATH_CLI_WORKING_DIR=/uipath/uipath.cli/$UIPATH_CLI_VERSION/tools

WORKDIR /uipath

# The following commands do the following:
# 1) Add the UiPath package source to the local registry
# 2) Create a dummy project we want to associate the package with. This is because there is no way to add a package via
#    the package manager without it being bound to an actual project. 
#    See: https://uipath.visualstudio.com/Public.Feeds/_artifacts/feed/UiPath-Official/connect
# 3) Currently adding the package causes an incompatibility error that prevents it from being added to the project
#    so we have to tell it to add it regardless via the -n switch
# 4) Add the package binary again into the current folder, but ignore the incompatibility error
#    as we still get the package downloaded and for the moment it still works!
RUN apt-get update && apt-get install -y && rm -rf /var/lib/get/lists/* \
    && dotnet nuget add \
      source https://uipath.pkgs.visualstudio.com/Public.Feeds/_packaging/UiPath-Official/nuget/v3/index.json \
      --name UiPath-Official \
    && dotnet new console \
    && dotnet add package UiPath.CLI --version $UIPATH_CLI_VERSION -n \
    && dotnet add package UiPath.CLI --version $UIPATH_CLI_VERSION --package-directory .; exit 0

# Switch to where the CLI tooling resides and make sure the DLL is executable
WORKDIR $UIPATH_CLI_WORKING_DIR
RUN chmod +x ./uipcli.dll

# Copy the CLI runner script to the root
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

COPY uipcli.sh /
RUN chmod +x /uipcli.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
