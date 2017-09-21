#!/usr/bin/env bash

ADDR=${1:-"http://localhost:8080"}
curl -v -d@user.json ${ADDR}/chat/user
