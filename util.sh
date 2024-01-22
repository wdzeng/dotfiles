#!/bin/bash

_SCRIPT_PATH=$(readlink -f "${BASH_SOURCE[0]}")
_LIST_PATH="$(dirname "$_SCRIPT_PATH")/list.txt"

config_list() {
    while IFS= read -r line; do
        echo "$line"
    done < <(grep -vE '^\s*(#|$)' "$_LIST_PATH")
}
