#!/usr/bin/env bash
set -eu

DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends r-base r-base-dev r-base-core r-cran-devtools r-cran-tidyverse
