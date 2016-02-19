#!/bin/bash
set -x
set -e
yum install -y rpm-build rubygems ruby-devel gcc make /usr/bin/easy_install sudo which
gem install fpm
useradd -u ${XUID:-1000} bob

: ${ITERATION:=1}

sudo -i -u bob $(which fpm) --iteration ${ITERATION}.${DIST} -s python -t rpm pbr
sudo -i -u bob $(which fpm) --iteration ${ITERATION}.${DIST} -s python -t rpm pyyaml
sudo -i -u bob $(which fpm) --iteration ${ITERATION}.${DIST} -s python -t rpm ordereddict
sudo -i -u bob $(which fpm) --iteration ${ITERATION}.${DIST} -s python -t rpm python-jenkins
sudo -i -u bob $(which fpm) --iteration ${ITERATION}.${DIST} -s python --provides "python-multi-key-dict" -t rpm multi-key-dict 
sudo -i -u bob $(which fpm) --iteration ${ITERATION}.${DIST} -s python -t rpm jenkins-job-builder
sudo yum localinstall -y /home/bob/*.rpm
cp -a /home/bob/*.rpm /work

