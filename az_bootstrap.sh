#!/bin/sh
set -e -x

apt-get --yes --quiet update
apt-get --yes --quiet install git puppet-common dos2unix

#
# Fetch puppet configuration from public git repository.
#

mv /etc/puppet /etc/puppet.orig
git clone https://gitlab.com/tdimaggio/aws.git /etc/puppet

#
# Run puppet.
#

puppet apply /etc/puppet/manifests/

#
# fix shebang issue with run-puppet file
#

dos2unix /usr/local/bin/run-puppet