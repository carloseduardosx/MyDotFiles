#!/bin/bash

export FUNCTIONS=$HOME/Projects/MyDotFiles/functions
export SECRETS=$HOME/Projects/MyDotFiles/secrets/functions

. $FUNCTIONS/.android
. $FUNCTIONS/.git_functions
. $FUNCTIONS/.util
. $FUNCTIONS/.java_functions
. $FUNCTIONS/.docker
. $FUNCTIONS/.cordova
. $FUNCTIONS/.babel
. $FUNCTIONS/.corona
. $FUNCTIONS/.python
. $FUNCTIONS/.react_native
. $SECRETS/.ssh
. $SECRETS/.greenmile
. $SECRETS/.agenda

