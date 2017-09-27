all: build

build:
	@docker build -t hrektts/rust-emscripten:latest .

release: build
	@docker build -t hrektts/rust-emscripten:$(shell cat Dockerfile | \
		grep version | \
		sed -e 's/[^"]*"\([^"]*\)".*/\1/') .
