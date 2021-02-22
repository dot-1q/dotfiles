#!/bin/sh

sensors | grep temp1 | sed -n -e '2p' | awk -F'+|°|C' '{print $2}'
