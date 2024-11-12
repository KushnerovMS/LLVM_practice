#!/usr/bin/sh

set -x

clang start.c sim.c app.c -lSDL2 -o app.out
