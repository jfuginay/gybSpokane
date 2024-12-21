#!/bin/bash

# Ensure directories exist
mkdir -p /var/taky
mkdir -p /data/taky/uploads

# Start taky server directly on host
exec /opt/venv/bin/taky -l debug
