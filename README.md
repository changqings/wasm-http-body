# istio wasm_http demo
- tested istio and k8s version
```
k8s > 1.20
istio > 1.12
envoy > 1.28.0
rust >= 1.87.0
```

Add new target
```shell
rustup update
rustup target add wasm-wasip1
```

编译
```shell script
make build
# or
cargo build --target wasm32-wasip1 --release
```

完成后`.wasm`文件在`target/wasm32-wasip1/release/wasm_http_body.wasm`，可以使用 [Envoy](#envoy) 或者 [istio](#istio) 在集群中测试。

启动后访问[http://localhost:8080]
```
I am here, from wasm
```

## Envoy

[envoy install](https://www.envoyproxy.io/docs/envoy/latest/start/install)
```shell
envoy --version

envoy  version: b5ca88acee3453c9459474b8f22215796eff4dde/1.28.0/Clean/RELEASE/BoringSSL
```

测试
```shell
make run
# or
envoy -c ./envoy.yaml --concurrency 2 --log-format '%v'
```

## Wasme

[wasme install](https://docs.solo.io/web-assembly-hub/latest/installation/)
```shell
wasme --version
```

打包
```shell script
make build-image
```