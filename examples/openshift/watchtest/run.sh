#!/bin/bash
# Copyright 2016 Crunchy Data Solutions, Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

oc project openshift

LOC=$BUILDBASE/examples/openshift/watchtest

oc create -f $LOC/watch-sa.json
oc policy add-role-to-group edit system:serviceaccounts -n openshift
oc policy add-role-to-group edit system:serviceaccounts -n default
#oc process -f $BUILDBASE/examples/openshift/watchtest/complex2.json | oc create -f -
echo "sleep 20 to give master time to start..."
sleep 20
oc process -f $LOC/watch.json | oc create -f -
