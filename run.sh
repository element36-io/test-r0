#!/bin/bash
set -e

# Define the GitHub token to get rid of binstall warning to rule this out as cause for error
GITHUB_TOKEN=$(gh auth token)

# Build the Docker image, passing the GitHub token as a build argument
docker buildx build . --progress=plain --build-arg GITHUB_TOKEN="$GITHUB_TOKEN"

# Build for amd64 - works
#docker build --platform linux/amd64 .

# Build for arm64 - breaks
#echo "============================================"
#docker build --platform linux/arm64 .

# faster cross-build
# docker build --platform linux/arm64,linux/arm64 .