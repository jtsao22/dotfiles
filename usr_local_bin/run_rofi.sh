#!/usr/bin/env bash

rofi -combi-modi window,drun,run -show combi -modi combi -run-list-command \"source ~/.i3/i3scripts/rofi_alias_support\" -run-command \"/bin/bash -i -c '{cmd}'\" -rnow
