# UIPath CLI Docker Image Build

# Building the Image
```shell
docker build --no-cache -t uipathcli .
```

# Running Container from Command Line
```shell
docker run /uipathcli.sh test run \
    "https://cloud.uipath.com" \
    "<UIPath tenant name>" \
    -A "<UIPath account name>" \
    -I "<UIPath external application client Id>" \
    -S "<UIPath external application client secret>" \
    -s "<Name of the Test Set to execute>" \
    -o "<Name of the folder where the Test Set resides>" \
    --applicationScope "<UIPath external application 'application' scopes>"
```

# Incorporating Container in GitLab Pipeline
TBC