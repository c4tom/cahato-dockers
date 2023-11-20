#!/bin/bash
# @app      cahato/alpine
# @author   cahato https://github.com/c4tom

. /scripts/util.sh

# execute any pre-init scripts wich is useful for images based on this image
# /scripts/pre-init.d/XX-name.sh 
# low XX are run first
preInit "/scripts/pre-init.d"
