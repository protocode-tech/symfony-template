#!/bin/bash

set -e

docker-compose run --rm -u $(id -u):$(id -g) -it app composer install
