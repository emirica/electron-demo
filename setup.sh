#!/bin/bash

set -x

# cleanup
rm -fr node_modules/
rm -fr typings/
rm *.js
rm -fr demo/
rm -fr debian/
rm -fr app.asar

# setup
#npm install
#node_modules/.bin/typings install
