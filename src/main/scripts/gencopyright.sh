#!/bin/sh
#
# JBoss, Home of Professional Open Source
# Copyright 2011-2013 Red Hat, Inc. and/or its affiliates, and individual contributors
# by the @authors tag. See the copyright.txt in the distribution for a
# full listing of individual contributors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# gencopyright.sh
#
# Generates the copyright.txt file mentioned in the license header
# @author Kevin Pollet
# @author Emmanuel Bernard

SCRIPT_PATH=$(dirname $0)
ROOT_PATH="$SCRIPT_PATH/../../../"
COPYRIGHT_FILE_NAME="copyright.txt"
CONTRIBUTOR_OF_THIS_FILE="Kevin Pollet\nEmmanuel Bernard"

# exclude this file as it matches with a weird name [^
# add back Kevin and Emmanuel to the list to match this file
JAVADOC_AUTHORS=$(grep '@author [^<]*' -ho -r --include="*.java" --include="*.sh" --include="*.xml" --exclude="gencopyright.sh" --include="*.xsd" $ROOT_PATH | sed 's/@author//;s/^[[:space:]]*//;s/[[:space:]]*$//;s/"\r"//')

GIT_AUTHORS=$(git log --pretty=format:"%an")

echo "$JAVADOC_AUTHORS\n$GIT_AUTHORS\n$CONTRIBUTOR_OF_THIS_FILE" | sort -f | uniq -i > $ROOT_PATH$COPYRIGHT_FILE_NAME
