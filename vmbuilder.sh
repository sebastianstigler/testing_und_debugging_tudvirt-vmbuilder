#!/bin/bash
# vim: ft=sh:tw=80:ts=4:sta:sw=4:si:ci
#************************************************************* SHELL SCRIPT ***
#   NAME
#       vmbuilder.sh -- Create basic VM image and provision via ansible
#
#
#   FIRST RELEASE
#       2015-01-22  Sebastian Stigler		sebastian.stigler@htw-aalen.de
#
#   COPYRIGHT (C) 2015
#******************************************************************************

set -e

#******************************************************************************
#*** check commandline argument for git repository to ansible playbook

if [ $# -lt 1 ];
then
  echo "Specify a git repository for the ansible playbook"
  exit
fi

if [ `git ls-remote "$1" | wc -l` -lt 1 ];
then
  echo "Git repository is empty"
  exit
fi


#******************************************************************************
#*** Insert git repository to ansible playbook in exec.sh script

TEMP=`mktemp -d`

cat execscript.sh.tmpl | sed -e "s^REPOSITORY^${1}^" > ${TEMP}/exec.sh
chmod 755 ${TEMP}/exec.sh

#******************************************************************************
#*** cleanup old image

rm -rf ubuntu-kvm

#******************************************************************************
#*** Build new image and provision it via ansible playbook

sudo vmbuilder kvm ubuntu -c config.cfg                 \
                          --exec=${TEMP}/exec.sh        \
                          --firstboot=`pwd`/boot.sh     \
                          --tmpfs=2000                  \
                          -v --debug 2>&1 | tee logfile

#                          --libvirt=qemu:///system

#******************************************************************************
#*** cleanup temp dir

[ ! -z ${TEMP} -a -d ${TEMP} ] && rm -rf ${TEMP}

#********************************************************************** END ***
