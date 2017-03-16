#!/bin/bash

################################################################################
# init
################################################################################
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WAIT_TIME=5
STOP=0
CONF="--quiet --no-color -C /app/config"

trap volumizr:ctrl-c INT

volumizr:ctrl-c() {
  echo " volumizr stopping..."
  STOP=1
}

volumizr:in() {
  mc $CONF mb $1 > /dev/null 2>&1
  echo "volumizr in created bucket $1 if it didn't exist"

  echo "volumizr in mirroring from $1 to $2"
  mc $CONF mirror --remove --force $1 $2
}

volumizr:mirror() {
  for file in $(find $1 -type f -newer /app/timestamp);
  do
    mc $CONF cp $file ${2}${file#$1}
    touch $file
  done
  mc $CONF mirror --remove --force $1 $2
  touch /app/timestamp
}

volumizr:out() {
  echo "volumizr out mirroring from $1 to $2"
  touch /app/timestamp

  while [ true ]; do
    if [ $STOP -eq 1 ]; then
      echo "volumizr out mirroring one last time ..."
      volumizr:mirror $1 $2
      echo "volumizr out stopped"
      exit 0
    else
      sleep $WAIT_TIME
    fi
    volumizr:mirror $1 $2
  done
}

################################################################################
# main
################################################################################
usage_no_exit() {
    cat >&2 <<EOF
Usage:
volumizr --help | help

volumizr in <source> <target>
Example: volumizr in minio/mysql0 /var/lib/mysql

volumizr out <source> <target>
Example: volumizr out /var/lib/mysql minio/mysql0

EOF
}

usage() {
    usage_no_exit
    exit 1
}

handle_help_arg() {
    if [ "$1" = "--help" ] ; then
        usage_no_exit
        exit 0
    fi
}

handle_help_arg "$1" || handle_help_arg "--$1"

[ $# -gt 2 ] || usage
COMMAND=$1
shift 1

handle_help_arg "$1"

case "$COMMAND" in
    in)
    volumizr:in "$1" "$2"
    ;;
    out)
    volumizr:out "$1" "$2"
    ;;
    *)
    echo "Unknown volumizr command '$COMMAND'" >&2
    usage
    ;;
esac
