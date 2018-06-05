#!/bin/sh

SUPPORT=$(grep '^Linux-Maximum:' META | cut -d ':' -f 2 | tr -d ' \n' )
MAJOR=$(echo $SUPPORT|cut -d'.' -f1)
MINOR=$(echo $SUPPORT|cut -d'.' -f2)
NEXT=$((MINOR+1))

echo "${MAJOR}.${NEXT}"
