#!/bin/bash
cecho() {
    echo -e "\033[$1m$2\033[0m"
}
cecho 31 OK
