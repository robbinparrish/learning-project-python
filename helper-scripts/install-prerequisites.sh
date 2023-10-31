#!/bin/bash
#
# Install Prerequisites those mostly requires during CI pipeline build.
#

# Fail on error.
set -e

export DEBIAN_FRONTEND=noninteractive

# Install common utilities and tools.
apt-get update
apt-get install -y --no-install-recommends --no-install-suggests \
        curl wget tar zip bzip2 unzip ca-certificates gnupg git


# Install Python.
apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	python3 python3-pip python3-full python3-all-dev && \
	apt-get clean all

# Create some soft links.
cd /usr/bin && \
        ln -sf python3 python && \
        ln -sf python3-config python-config

# Install some libraries.
pip install --break-system-packages \
	pipreqs pytest setuptools


# Print Python version.
python --version
