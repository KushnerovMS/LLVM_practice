#!/usr/bin/sh

set -x

# build program
clang start.c sim.c app.c -lSDL2 -o app.out

# generate LLVM IR
mkdir LLVM_IR
clang app.c -S -O1 -emit-llvm -o LLVM_IR/app.ll
