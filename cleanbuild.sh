#!/bin/bash

if [ -z "$HISTOMICS_SOURCE_FOLDER" ]
then
  echo "Set environment variable HISTOMICS_SOURCE_FOLDER to HistomicsTK source directory"
  exit 1
fi

$HISTOMICS_SOURCE_FOLDER/ansible/deploy_docker.py rm
# Remove all files created in previous installations, including previous databases.
# This is important if mongodb has been updated to a new version that is not compatible.
sudo rm -rf $HOME/.histomicstk/

$HISTOMICS_SOURCE_FOLDER/ansible/deploy_docker.py start --pull --latest
docker exec -it histomicstk_histomicstk bash -c "cd /opt/histomicstk/build && \
    cmake -DRUN_CORE_TESTS:BOOL=OFF \
          -DTEST_PLUGINS:STRING=HistomicsTK \
          ../girder/ \
    && make -j"
docker exec -it histomicstk_histomicstk bash -c "cd /opt/histomicstk/build && ctest -V"
