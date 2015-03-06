#!/bin/bash
set -e

SOURCE=$0
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


cp -r $DIR/../dotfiles $DIR/dotfiles
cp -r $DIR/../bin $DIR/bin
docker build -t pkinsky/rig $DIR
rm -r $DIR/dotfiles
rm -r $DIR/bin
