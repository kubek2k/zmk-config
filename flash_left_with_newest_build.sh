#!/bin/bash

set -e

if [ $# -ne 1 ]; then
  echo "$0 <device>"
  exit 1
fi

DEVICE="$1"

TEMP_DIR=$(mktemp -d /tmp/zmk_firmware.XXXXXXXX)
mkdir ${TEMP_DIR}/mount
RUN_ID=$(gh run list -w ci --limit 1 --json databaseId | jq .[0].databaseId -r)
echo "Downloading result of $RUN_ID"
gh run download "$RUN_ID" -D ${TEMP_DIR}

echo "Umounting the ${DEVICE} as for some reason I need to (sudo)"
sudo umount ${DEVICE}
echo "Mounting it again but properly"
sudo mount -t msdos ${DEVICE} $TEMP_DIR/mount
cp ${TEMP_DIR}/zmk_firmware/zmk_left.uf2 ${TEMP_DIR}/mount
