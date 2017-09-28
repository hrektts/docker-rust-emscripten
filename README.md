# docker-rust-emscripten

Dockerfile to build a container encloseing Rust and Emscripten.

[![Travis Build Status](https://travis-ci.org/hrektts/docker-rust-emscripten.svg?branch=master)](https://travis-ci.org/hrektts/docker-rust-emscripten)

## Usage

``` shell
cd /path/to/code
docker run -u dev:$(id -g) -v $(pwd):/data --rm -it hrektts/rust-emscripten cargo build --target wasm32-unknown-emscripten
```
