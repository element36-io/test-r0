FROM rust:1.75-bookworm as build
RUN cargo install cargo-binstall --version 1.6.2
RUN cargo binstall cargo-risczero --version 0.20.1