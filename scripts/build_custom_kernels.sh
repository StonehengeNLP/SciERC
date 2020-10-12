#!/bin/bash

TF_ORIGIN=$(python -c 'import importlib; print(importlib.util.find_spec("tensorflow").origin)')
TF_DIR=$(dirname $TF_ORIGIN)
TF_INC=$TF_DIR/include
TF_LIB=$TF_DIR

ldd srl_kernels.so
sudo ln -s libtensorflow_framework.so.1 -f libtensorflow_framework.so

g++ -std=c++11 -shared srl_kernels.cc -o srl_kernels.so \
    -I$TF_INC -I$TF_INC/external/nsync/public \
    -L$TF_LIB -ltensorflow_framework \
    -fPIC -O2 -D_GLIBCXX_USE_CXX11_ABI=0
