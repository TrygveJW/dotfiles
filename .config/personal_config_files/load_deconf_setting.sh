#!/bin/bash

if [-a "./gnome-terminal-profiles.dconf"] then
    dconf load /org/gnome/terminal/legacy/profiles:/ < ./gnome-terminal-profiles.dconf
fi
