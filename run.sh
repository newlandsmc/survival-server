#!/bin/bash

rconHost='69.129.212.211'
rconPort='25577'
rconPass='uhP2emAfauYvKLmCer8ndcsw5BnFYHtR'

/var/minecraft/mcrcon/mcrcon -H $rconHost -P $rconPort -p $rconPass "$1"
