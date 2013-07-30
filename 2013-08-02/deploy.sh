#!/bin/bash

BASEDIR=${0%/*}
cd $BASEDIR

echo "Clear deployed files."
rm -rf deploy
mkdir -p deploy/img

echo "Compile 'css'."
compass compile src/style.scss

echo "Copy source files."
cp src/img/* deploy/img/
cp src/script.js deploy/script.js
cp src/bals.htm deploy/bals.htm

echo "Done!"
