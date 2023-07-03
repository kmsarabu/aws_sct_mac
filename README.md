# Run AWS Schema Conversion Tool as Docker container on MacOS M1

## Install XQuartz

```
 brew install xquartz
 open -a XQuartz
 Goto XQuartz->Settings->Security and check "Authenticate Connections" and "Allow connections from network clients"
 Stop and restart XQuartz
 xhost + $(hostname)
```

## Build container image

```
 git clone https://github.com/kmsarabu/aws_sct_mac.git
 sudo docker buildx build --rm --platform linux/amd64 --force-rm=true --no-cache=true -t aws_sct .
```

## Run the container

```
 docker run --rm -e DISPLAY=host.docker.internal:0 -e LIBGL_ALWAYS_INDIRECT=1 --memory=4096M --platform linux/amd64 -ti aws_sct
```
