#!/bin/bash

HERE=$(dirname $(realpath $0))
cd $HERE
source "$EMSDK_ENV_PATH"/emsdk_env.sh
emcmake cmake -B build -S .
cmake --build build
