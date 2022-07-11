#!/usr/bin/env bash
set -eu

#DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends cuda-10-0
#DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends cuda-10-1
#DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends cuda-11-2
DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends cuda-nvml-dev-11-6 cuda-11-6 libcusparse-dev-11-6 cuda-libraries-dev-10-1 libcublas10 cuda-libraries-dev-11-0 libcusparse-11-6 cuda-compat-11-6 cuda-cudart-11-6 libcublas-dev-11-6 libcublas-11-0 cuda-nvprof-11-6 cuda-nvtx-11-6 libcurl4-openssl-dev cuda-libraries-dev-10-0 cuda-11-0 cuda-libraries-dev-11-6 libcublas-11-6 cuda-command-line-tools-11-6 cuda-minimal-build-11-6 cuda-libraries-11-6 libcublas-dev libcurl4
