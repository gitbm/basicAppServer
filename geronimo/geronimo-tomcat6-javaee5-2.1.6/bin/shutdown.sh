#!/bin/sh
#
#  Licensed to the Apache Software Foundation (ASF) under one or more
#  contributor license agreements.  See the NOTICE file distributed with
#  this work for additional information regarding copyright ownership.
#  The ASF licenses this file to You under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance with
#  the License.  You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# --------------------------------------------------------------------
# $Rev: 575171 $ $Date: 2007-09-13 01:15:48 -0400 (Thu, 13 Sep 2007) $
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Shutdown script file for Geronimo.
#
# This script calls the geronimo.sh script passing "stop" as the
# first argument followed by the arguments supplied by the caller.
#
# This script is based upon Tomcat's shutdown.sh file to enable
# those familiar with Tomcat to easily stop Geronimo.
# 
# Alternatively you can use the more comprehensive geronimo.sh file 
# directly.
#
# Invocation Syntax:
#
#   shutdown.sh [geronimo.sh stop command args] 
#
#   Invoke the shutdown.sh file without any arguments for information
#   on arguments for the geronimo.sh stop command that is invoked
#   by this script.
#
# Environment Variable Prequisites:
#
#   Refer to the documentation in the geronimo.sh file for information
#   on environment variables etc.
#
# --------------------------------------------------------------------

# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done
 
PRGDIR=`dirname "$PRG"`
EXECUTABLE=geronimo.sh

# Check that target executable exists
if [ ! -x "$PRGDIR"/"$EXECUTABLE" ]; then
  echo "Cannot find $PRGDIR/$EXECUTABLE"
  echo "This file is needed to run this program"
  exit 1
fi

exec "$PRGDIR"/"$EXECUTABLE" stop "$@"
