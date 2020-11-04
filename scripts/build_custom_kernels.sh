#!/bin/bash

TF_ORIGIN=$(python3 -c 'import importlib; print(importlib.util.find_spec("tensorflow").origin)')
TF_DIR=$(dirname $TF_ORIGIN)
TF_INC=$TF_DIR/include
TF_LIB=$TF_DIR

SCIIE_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; cd ../sciie ; pwd -P )"

g++ -std=c++11 -shared $SCIIE_PATH/srl_kernels.cc -o $SCIIE_PATH/srl_kernels.so \
    -I$TF_INC -I$TF_INC/external/nsync/public \
    -L$TF_LIB -ltensorflow_framework \
    -fPIC -O2 -D_GLIBCXX_USE_CXX11_ABI=1
