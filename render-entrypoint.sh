#!/bin/sh

mkdir -p /tmp/pgadmin
cp /etc/secrets/* /tmp/pgadmin
chown -R pgadmin:root /tmp/pgadmin

sudo -Eu pgadmin /entrypoint.sh
