#!/bin/bash

alias gradle='gradle --console rich'

#cd ~/tuning

if [ "$TERM" = "linux" ]; then
    #echo load custom key mapping
    #loadkeys ./loadkeys
    echo nope
fi

export GOPATH=~/projects/go
