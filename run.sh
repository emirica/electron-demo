#!/bin/bash

set -x

# compile
node_modules/.bin/tsc

# run app
node_modules/electron/dist/electron .