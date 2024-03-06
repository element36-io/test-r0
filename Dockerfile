# Base stage for building
# picks arm64 (= aarch64) on macos and amd64 on my linux machine
FROM debian:12.5 as build

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    git \
    pkg-config \
    libssl-dev \
    cmake

# Install Rust 1.75
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs   | sh -s -- -y --default-toolchain 1.75

# try adding toolchain frm template
ENV PATH="/root/.cargo/bin:${PATH}"
COPY rust-toolchain.toml /
RUN rustup toolchain install .

# aarch64   on macos
RUN ARCH=$(uname -m) && echo "Architecture: $ARCH"

RUN cargo install cargo-binstall  --version 1.6.2 
RUN echo $PATH && ls -la /root/.cargo/bin

# without --target=aarch64-apple-darwin
# it will look for aarch64 which is not found and thus all gets compiled
# if removed it will compile the r0 stack and quits with same errors
RUN cargo binstall cargo-risczero -y 
# i --version 0.19.1 
# --target=aarch64-apple-darwin

RUN echo $PATH && ls -la /root/.cargo/bin
RUN apt install python3 -y
RUN apt-get install ninja-build
# fails with Syntax errors
RUN cargo risczero help

# fails with Syntax errors
RUN cargo risczero build-toolchain

# also faisl with Syntax errors
# RUN cargo risczero install

RUN rustup toolchain list --verbose | grep risc0
