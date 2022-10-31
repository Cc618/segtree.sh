#!/bin/bash

. ./segtree.sh

query_no_update() {
    seg=($(make_seg 1 2 3))

    [ $(query_seg 0 3 "${seg[@]}") = 6 ] || exit 1
    [ $(query_seg 1 3 "${seg[@]}") = 5 ] || exit 1
    [ $(query_seg 2 3 "${seg[@]}") = 3 ] || exit 1
    [ $(query_seg 1 2 "${seg[@]}") = 2 ] || exit 1
    [ $(query_seg 0 2 "${seg[@]}") = 3 ] || exit 1
    [ $(query_seg 0 0 "${seg[@]}") = 0 ] || exit 1
    [ $(query_seg 3 3 "${seg[@]}") = 0 ] || exit 1

    echo query_no_update - OK
}

query_update() {
    seg=($(make_seg 1 2 3))
    echo "seg init: ${seg[@]}"

    seg=($(update_seg 0 11 "${seg[@]}"))
    echo "seg after: ${seg[@]}"

    [ $(query_seg 0 3 "${seg[@]}") = 16 ] || exit 1
    [ $(query_seg 1 3 "${seg[@]}") = 5 ] || exit 1
    [ $(query_seg 2 3 "${seg[@]}") = 3 ] || exit 1
    [ $(query_seg 1 2 "${seg[@]}") = 2 ] || exit 1
    [ $(query_seg 0 2 "${seg[@]}") = 13 ] || exit 1
    [ $(query_seg 0 0 "${seg[@]}") = 0 ] || exit 1
    [ $(query_seg 3 3 "${seg[@]}") = 0 ] || exit 1

    seg=($(update_seg 1 0 "${seg[@]}"))

    [ $(query_seg 0 3 "${seg[@]}") = 14 ] || exit 1
    [ $(query_seg 1 3 "${seg[@]}") = 3 ] || exit 1
    [ $(query_seg 2 3 "${seg[@]}") = 3 ] || exit 1
    [ $(query_seg 1 2 "${seg[@]}") = 0 ] || exit 1

    echo query_update - OK
}

query_no_update
query_update

echo Done
