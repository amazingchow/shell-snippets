#!/bin/bash

# does post request benchtest using wrk
wrk --threads=8 \
    --connections=100 \
    --duration=300s \
    --script=http_post.lua \
    http://localhost:8080/tesla/model3/inventory
