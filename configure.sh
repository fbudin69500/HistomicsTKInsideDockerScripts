#!/bin/bash

docker exec -it histomicstk_histomicstk bash -c "
  cd /opt/histomicstk/girder && \
  npm install && \
  sudo npm install -g npx && \
  sudo girder-install plugin -s /opt/histomicstk/HistomicsTK"
