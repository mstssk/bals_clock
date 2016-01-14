#!/bin/bash

BASEDIR=${0%/*}
cd $BASEDIR

echo "Clear deployed files."
rm -rf deploy
mkdir -p deploy/img

echo "Compile 'css'."
compass compile src/style.scss

echo "Compress 'js'."
# java -jar lib/closure-compiler/compiler.jar --js src/script.js --js_output_file deploy/script.js
cp src/script.js deploy/script.js

echo "Copy image and html files."
cp src/img/* deploy/img/
cp src/bals.htm deploy/bals.htm

echo "Compiling Done!"

sleep 1
