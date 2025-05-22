.DEFAULT_GOAL := build

.PHONY: build clean run

build:
	cargo build \
	--target wasm32-wasip1 \
	--release

clean:
	cargo clean
run:
	envoy -c ./envoy.yaml \
	--concurrency 2 \
	--log-format '%v'

build-image: build
	docker build -t ccr.ccs.tencentyun.com/xxx/wasm:wasm_http_demo-v0.0.1 .