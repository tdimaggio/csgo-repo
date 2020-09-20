#!/bin/bash
cd /etc/puppet && git pull
/usr/bin/puppet apply manifests/
