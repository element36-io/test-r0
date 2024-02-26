FROM --platform=$TARGETPLATFORM rust:1.75-bookworm as build

RUN apt-get install -y bash
ENV A=b
# RUN cargo install cargo-binstall --version 1.6.2
RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
# currently there is a bug in cargo-binstall that prevents it from installing
# RUN cargo binstall cargo-risczero --version 0.20.1

RUN cargo binstall -y  cargo-risczero --version 0.20.1