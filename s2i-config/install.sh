#!/usr/bin/env bash

set -e

SCRIPT_ID=$(basename -- "$0")
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"

echo +----------------------------------------------------------------------+
echo + Started running s2i script: $SCRIPT_DIR/$SCRIPT_ID
echo +----------------------------------------------------------------------+

source ${JBOSS_HOME}/bin/launch/openshift-common.sh
source ${JBOSS_HOME}/bin/launch/logging.sh
source ${JBOSS_HOME}/bin/launch/configure.sh

if [ "${MY_ENV}" == "true" ]; then
    echo "MY_ENV...:" ${MY_ENV}
    $JBOSS_HOME/bin/jboss-cli.sh --file=$SCRIPT_DIR/scripts/test.cli
fi

echo +----------------------------------------------------------------------+
echo + Ended running s2i script: $SCRIPT_DIR/$SCRIPT_ID
echo +----------------------------------------------------------------------+

# REFERENCES
# https://octopus.com/blog/using-the-wildfly-cli
