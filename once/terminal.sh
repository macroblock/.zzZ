#!/bin/bash

cd ~/tuning/once

if [ "$TERM" = "linux" ]; then
    echo load custom key mapping
    sudo loadkeys ./loadkeys
    sudo setupcon
fi

cd ~

