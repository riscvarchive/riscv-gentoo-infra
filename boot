#!/bin/bash

set -ex

spike +disk=generated/scratch.img \
      /usr/riscv64-unknown-linux-gnu/usr/bin/bbl \
      generated/vmlinux
