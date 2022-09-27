#!/bin/bash

rconHost='localhost'
rconPort='25577'
rconPass='uhP2emAfauYvKLmCer8ndcsw5BnFYHtR'

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cAsthonia maintenance in 30 seconds.'

sleep 25

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cAsthonia maintenance in 5 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cAsthonia maintenance in 4 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cAsthonia maintenance in 3 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cAsthonia maintenance in 2 seconds.'

sleep 1

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'broadcast &cAsthonia maintenance in 1 second.'

sleep 1

sudo systemctl stop asthonia
