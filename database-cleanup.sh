#!/bin/bash

rconHost='localhost'
rconPort='25577'
rconPass='uhP2emAfauYvKLmCer8ndcsw5BnFYHtR'

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass 'co purge t:30d'
