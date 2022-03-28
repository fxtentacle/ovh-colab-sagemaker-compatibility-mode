#!/usr/bin/env bash
set -eu

DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends cuda-nvml-dev-11-1 cuda-11-1 libcusparse-dev-11-1 cuda-libraries-dev-10-1 libcublas10 cuda-libraries-dev-11-0 libcusparse-11-1 cuda-compat-11-1 cuda-cudart-11-1 libcublas-dev-11-1 libcublas-11-0 cuda-nvprof-11-1 cuda-nvtx-11-1 libcurl4-openssl-dev cuda-libraries-dev-10-0 cuda-11-0 cuda-libraries-dev-11-1 libcublas-11-1 cuda-command-line-tools-11-1 cuda-10-0 cuda-minimal-build-11-1 libcudnn7 libcudnn7-dev cuda-10-1 cuda-libraries-11-1 libcublas-dev libcurl4
