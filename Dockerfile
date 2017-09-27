FROM trzeci/emscripten-slim:sdk-tag-1.37.21-64bit
LABEL maintainer="mps299792458@gmail.com" \
      version="0.1.0"

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 15CF4D18AF4F7421 \
 && echo "deb http://apt.llvm.org/jessie/ llvm-toolchain-jessie-5.0 main" \
    > /etc/apt/sources.list.d/llvm.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    clang-5.0 \
    curl \
    libclang-5.0-dev \
    llvm-5.0-dev \
    sudo \
    wget \
 && rm -rf /var/lib/apt/lists/*

RUN adduser --uid 1000 --disabled-login --gecos 'Developper' dev \
 && passwd -d dev \
 && gpasswd -a dev sudo \
 && chown -R dev:dev /emsdk_portable

USER dev
ENV PATH=/home/dev/.cargo/bin:$PATH
RUN wget -qO - https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly \
 && rustup target add asmjs-unknown-emscripten \
 && rustup target add wasm32-unknown-emscripten

WORKDIR /data
VOLUME ["/data"]
