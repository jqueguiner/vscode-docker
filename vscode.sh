#!/usr/bin/env sh
set -eu
/usr/bin/code-server --bind-addr 0.0.0.0:8080 . --auth none
