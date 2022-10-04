#!/usr/bin/env bash

set -e

CONTAINER=$(docker container list --format '{{json .}}' | jq -sr '.[] | select(.Names=="localdev-extension-runtime")')

if [ "$CONTAINER" == "" ]; then
    echo "'localdev' extension environment stopped."
    exit 1
fi

docker exec -i localdev-extension-runtime /repo/scripts/ext/exec/refresh.sh
