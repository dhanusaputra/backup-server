#!/usr/bin/env bash

if [ "$#" != 2 ]; then
  echo "usage $0 src dst"
  exit 1
fi

src=$1
dst=$2

ext_disk=$(blkid | grep sda | cut -d ' ' -f 1 | tr -d)

if [ -z "$ext_disk" ]; then
  echo "cannot find external disk"
  exit 1
fi

mount -a
rsync -avz --no-o --no-g --no-perms "$src" "$dst"
umount -a
