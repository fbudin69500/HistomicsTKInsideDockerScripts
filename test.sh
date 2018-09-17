#!/bin/bash

docker exec -it histomicstk_histomicstk bash -c "\
    find /opt/histomicstk/girder/tests -type f -exec sed -i 's/mongodb:\/\/localhost:27017/mongodb:\/\/mongodb:27017/g' {} \; &&\
    cd /opt/histomicstk/build && \
    ctest $@"
