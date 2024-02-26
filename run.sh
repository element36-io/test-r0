#!/bin/bash
set -e
# Build for amd64 - works
docker build --platform linux/amd64 .

# Build for arm64 - breaks
echo "============================================"
docker build --platform linux/arm64 .

# faster cross-build
# docker build --platform linux/arm64,linux/arm64 .