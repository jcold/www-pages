#!/bin/sh

HOST="dev.liveio.cn"
USER=root
PORT=22

SHELL_FOLDER=$(
  cd "$(dirname "$0")"
  pwd
)

rsync -e "ssh -p $PORT" \
  --recursive \
  --verbose \
  --checksum \
  --delete \
  --compress \
  --links \
  --delete-after \
  --exclude=*.sh \
  --exclude=node_modules \
  --exclude=var \
  --exclude=\.* \
  ${SHELL_FOLDER}/. "$USER"@"$HOST":/root/www-pages
