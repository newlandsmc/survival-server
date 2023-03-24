#!/bin/bash

#git -C /var/minecraft/newlands/survival/plugins/Crates/loot/ pull
rsync -Ir --remove-source-files /var/minecraft/newlands/survival/pending-updates/* /var/minecraft/newlands/survival/plugins/
find /var/minecraft/newlands/survival/pending-updates/* -depth -type d -empty -delete

exit 0
