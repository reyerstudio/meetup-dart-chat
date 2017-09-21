#!/usr/bin/env bash

ID=${1}
ADDR=${2:-"http://localhost:8080"}
curl -v ${ADDR}/chat/user/${ID}
