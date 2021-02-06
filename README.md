# Local go cache

## Building & running

``` bash
make build up
```

## Basic setup

``` bash
DOCKER0_IP="$(ip -f inet addr show docker0 | awk '/inet / { sub(/\/.*/, "", $2); print $2 }')"
export GOPROXY="http://${DOCKER0_IP}:8008|https://proxy.golang.org,direct"
```

## Documentation

``` bash
go help goproxy
```
