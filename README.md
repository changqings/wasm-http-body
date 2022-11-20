# istio wasm_http_body_response
- tested istio and k8s version
```
k8s > 1.20
istio > 1.12
```

Add new target
```shell
rustup update
rustup target add wasm32-unknown-unknown
```

编译
```shell script
make build
# or
cargo build --target wasm32-unknown-unknown --release
```

完成后`.wasm`文件在`target/wasm32-unknown-unknown/release/wasm_http_body.wasm`，可以使用 [Envoy](#envoy) 或者 [istio](#istio) 在集群中测试。

启动后访问[http://localhost:8080]
```
I am here
```

## Envoy

[envoy install](https://www.envoyproxy.io/docs/envoy/latest/start/install)
```shell
envoy --version
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