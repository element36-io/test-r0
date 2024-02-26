#!/bin/bash
set -e
# Build for amd64
docker build --platform linux/amd64 .

# Build for arm64
docker build --platform linux/arm64 .

# Build for arm64
docker build --platform linux/arm64,linux/arm64 .