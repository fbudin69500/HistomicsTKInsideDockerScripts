#!/bin/bash

docker exec -it histomicstk_histomicstk bash -c "\
    cd /opt/histomicstk/build && \
    ctest $@"
