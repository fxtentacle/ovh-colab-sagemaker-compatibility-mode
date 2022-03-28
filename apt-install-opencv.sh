#!/usr/bin/env bash
set -eu

DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends libopencv-dev libboost-all-dev ffmpeg
