#!/bin/bash

# - $@: Values
make_seg() {
    seg=("$@" "$@")
    for i in $(seq $(($# - 1)) -1 0); do
        seg[$i]=$((${seg[2*i]} + ${seg[2*i+1]}))
    done

    echo "${seg[@]}"
}

# - $1: Left
# - $2: Right
# - $3...: Segment tree
query_seg() {
    l="$1"
    r="$2"
    shift
    shift
    seg=($@)

    l=$((l + $# / 2))
    r=$((r + $# / 2))

    sm=0
    while [ $l -lt $r ]; do
        if [ $((l % 2)) = 1 ]; then
            sm=$((sm + ${seg[l]}))
            l=$((l + 1))
        fi
        if [ $((r % 2)) = 1 ]; then
            r=$((r - 1))
            sm=$((sm + ${seg[r]}))
        fi

        l=$((l / 2))
        r=$((r / 2))
    done

    echo $sm
}

# - $1: Index
# - $2: Value
# - $3...: Segment tree
update_seg() {
    node="$1"
    val="$2"
    shift
    shift
    seg=($@)

    node=$((node + $# / 2))
    seg[node]=$val

    while [ $node -gt 1 ]; do
        node=$((node / 2))
        seg[$node]=$((${seg[2 * node]} + ${seg[2 * node + 1]}))
    done

    echo "${seg[@]}"
}
