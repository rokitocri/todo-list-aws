#!/bin/ksh
val=$(git commit -am "release")
if [ "$val"="nothing to commit" ] ; then exit 0; fi