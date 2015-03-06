#!/bin/bash
set -e
sh dev/build.sh
sh rig/build.sh && sh dxmonad/build.sh
