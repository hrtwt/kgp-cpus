#!/bin/bash
# ./parse.sh dir

set -eu

if [ $# != 1 ]; then
  echo "./parse.sh outDir"
  exit 1
fi

if [ ! -e "$1" ]; then
  echo "$1 does not exist"
  exit 1
fi

dir=$1

echo cpus,time

for i in "${dir}"/*; do
  if [[ ${i} =~ .*/(.*)-(.*).xml ]]; then
    p=${BASH_REMATCH[1]}
    cpus=${BASH_REMATCH[2]}
  fi
  if [[ $(grep time "${i}") =~ .*time=.(.*)./\>.* ]]; then
    time=${BASH_REMATCH[1]}
  else
    time=0
  fi
  echo ${cpus},${time}
done
