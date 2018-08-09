#!/usr/bin/env bash

PASSWORD=${1:-foo}

VOL=${PWD}/notebooks
DST=/notebooks
CMD="jupyter notebook --no-browser --allow-root --notebook-dir=${DST}"

BIGCMD="python3 -c \"from notebook.auth import security ; security.set_password('${PASSWORD}')\" && $CMD"

RUNCMD="docker run --runtime=nvidia"

${RUNCMD} -it --rm -p 10000:8888 --mount type=bind,src=$VOL,dst=${DST} torch:latest /bin/bash -c "$BIGCMD"
