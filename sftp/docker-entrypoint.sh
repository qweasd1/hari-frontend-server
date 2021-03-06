#!/bin/sh

# Checks for USER variable
if [ -z "$USER" ]; then
  echo >&2 'Please set an USER variable (ie.: -e USER=john).'
  exit 1
fi

# Checks for PASSWORD variable
if [ -z "$PASSWORD" ]; then
  echo >&2 'Please set a PASSWORD variable (ie.: -e PASSWORD=hackme).'
  exit 1
fi

echo "Creating user ${USER}"
adduser -D ${USER} -u 1001
echo "${USER}:${PASSWORD}" | chpasswd
exec "$@"