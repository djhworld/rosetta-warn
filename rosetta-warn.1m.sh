#!/bin/bash

pids=$(fuser /usr/libexec/rosetta/runtime 2>/dev/null | sed -e 's/.*: //g' | sed -e 's/ /,/g' )


if [[ $pids == "" ]]; then
    echo ""
else
    count=$(ps -c -o pid,command -p $pids | tail -n +2|wc -l | sed -e 's/ //g')
    echo "⚠️ $count"
    echo "---"
    echo "Open activity monitor | shell=open param1=\"/System/Applications/Utilities/Activity Monitor.app\""
    echo "---"
    echo "Running under Rosetta ($count):"
    ps -c -o pid,command -p $pids | tail -n +2 | while read -r line; do
        echo "$line"
    done
fi
