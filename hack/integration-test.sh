#!/bin/bash

# build dfget binary with the latest code
# and run a sleep 100000 command to keep the container alive
docker run --name DFGET1 --net host -v ~: ubuntu:16.04 bash -c "make build-dfget; sleep 100000"
docker run --name DFGET2 --net host -v ~: ubuntu:16.04 bash -c "make build-dfget; sleep 100000"

# build supernode binary with the latest code
# run supernode process in background
docker run --name DFGET2 --net host -v ~: ubuntu:16.04 bash -c "make build-supernode; supernode"

