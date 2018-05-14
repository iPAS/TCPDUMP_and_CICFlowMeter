#!/bin/bash
# https://www.vultr.com/docs/force-apt-get-to-ipv4-or-ipv6-on-ubuntu-or-debian
apt-get -o Acquire::ForceIPv4=true $@
