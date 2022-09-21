#!/bin/bash

git -C /var/minecraft/asthonia/plugins/Expeditions/loot/ pull
rsync -Ir --remove-source-files /var/minecraft/asthonia/pending-updates/* /var/minecraft/asthonia/plugins/
find /var/minecraft/asthonia/pending-updates/* -depth -type d -empty -delete

exit 0
