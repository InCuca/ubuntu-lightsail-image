#!/bin/bash

docker run -d -p 22:22 -p 8090:80 22222:22222 --name ubuntu-server -d ubuntu-server