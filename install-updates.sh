#!/bin/bash

#git -C /var/minecraft/survival/plugins/Crates/loot/ pull
rsync -Ir --remove-source-files /var/minecraft/survival/pending-updates/* /var/minecraft/survival/plugins/
find /var/minecraft/survival/pending-updates/* -depth -type d -empty -delete

exit 0
