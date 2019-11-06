#!/usr/bin/env bash

x=1
while make deploy with_docker=no ; do
    sleep 3
    echo "Welcome $x times"
    x=$(( $x + 1 ))
done