# Local go cache

Basic setup with cache and speedup:

``` bash
export GOPROXY='http://172.17.0.1:3000|https://proxy.golang.org'
```

The same with `direct` fallback:

``` bash
export GOPROXY='http://172.17.0.1:3000|https://proxy.golang.org,direct'
```

Documentation:

``` bash
go help goproxy
```
