#!/bin/bash

# Generate a version string from a git revision

set -e

TAG="${1}"

if [ -z ${TAG} ] ; then
    TAG="$(git describe HEAD)"
fi

FULL_VER="${TAG##zfs-}"
GIT_REV="${FULL_VER#*-}"

LAST_VER="${FULL_VER%%-*}"

CUT_VER="${LAST_VER%.0}"

if [ "${LAST_VER}" = "${CUT_VER}" ] ; then
    VERSION="${FULL_VER}"
else
    last_digit="${CUT_VER##*.}"
    let next_digit=last_digit+1

    VERSION="${CUT_VER%.*}.${next_digit}~${GIT_REV}"
fi

printf '%s' "${VERSION}"
