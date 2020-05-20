#!/usr/bin/env bash
set -euo pipefail
docker build . -f Dockerfile.base -t nickodell/docker-github-actions-runner:base
docker build . -f Dockerfile -t nickodell/docker-github-actions-runner:latest
docker push nickodell/docker-github-actions-runner:latest
