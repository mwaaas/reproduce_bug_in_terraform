#!/usr/bin/env bash

x=1

make init
while make deploy; do
    sleep 3
    echo "Welcome $x times"
    x=$(( $x + 1 ))
done