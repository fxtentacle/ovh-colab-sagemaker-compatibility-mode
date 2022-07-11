#!/usr/bin/env bash
set -eu

jupyter lab --ip=0.0.0.0 --port=8080 --no-browser --allow-root \
  --LabApp.token=${JUPYTER_AUTH_TOKEN} \
  --LabApp.custom_display_url=${JOB_URL_SCHEME}${JOB_ID}-8080.${JOB_HOST} \
  --LabApp.allow_remote_access=True \
  --LabApp.allow_origin='*' \
  --LabApp.disable_check_xsrf=True