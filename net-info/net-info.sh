#!/bin/bash
handle_path() {
    echo "Device path: ${1}"

    CURR_PATH="${1}/address"
    if [ -f "$CURR_PATH" ]; then
        ADDRESS=$(<"${CURR_PATH}")
        if [ -n "$ADDRESS" ]; then
            echo "Address: ${ADDRESS}"
        fi
    fi

    CURR_PATH="${1}/broadcast"
    if [ -f "$CURR_PATH" ]; then
        BROADCAST=$(<"${CURR_PATH}")
        if [ -n "$BROADCAST" ]; then
            echo "Broadcast: ${BROADCAST}"
        fi
    fi

    CURR_PATH="${1}/speed"
    if [ -f "$CURR_PATH" ]; then
        SPEED=$(<"${CURR_PATH}")
        if [ -n "$SPEED" ]; then
            echo "Speed: ${SPEED}Mb/s"
        fi
    fi

    CURR_PATH="${1}/duplex"
    if [ -f "$CURR_PATH" ]; then
        DUPLEX=$(<"${CURR_PATH}")
        if [ -n "$DUPLEX" ]; then
            echo "Duplex: ${DUPLEX}"
        fi
    fi

    CURR_PATH="${1}/operstate"
    if [ -f "$CURR_PATH" ]; then
        OPERSTATE=$(<"${CURR_PATH}")
        if [ -n "$OPERSTATE" ]; then
            echo "Operational state: ${OPERSTATE}"
        fi
    fi

    CURR_PATH="${1}/power/control"
    if [ -f "$CURR_PATH" ]; then
        POWER_CONTROL=$(<"${CURR_PATH}")
        if [ -n "$POWER_CONTROL" ]; then
            echo "Power control: ${POWER_CONTROL}"
        fi
    fi

    CURR_PATH="${1}/carrier"
    if [ -f "$CURR_PATH" ]; then
        CARRIER=$(<"${CURR_PATH}")
        if [ -n "$CARRIER" ]; then
            echo "Carrier: ${CARRIER}"
        fi
    fi

    CURR_PATH="${1}/carrier_changes"
    if [ -f "$CURR_PATH" ]; then
        CARRIER_CHANGES=$(<"${CURR_PATH}")
        if [ -n "$CARRIER_CHANGES" ]; then
            echo "Carrier changes: ${CARRIER_CHANGES}"
        fi
    fi

    CURR_PATH="${1}/carrier_down_count"
    if [ -f "$CURR_PATH" ]; then
        CARRIER_DOWN_COUNT=$(<"${CURR_PATH}")
        if [ -n "$CARRIER_DOWN_COUNT" ]; then
            echo "Carrier down count: ${CARRIER_DOWN_COUNT}"
        fi
    fi

    CURR_PATH="${1}/carrier_up_count"
    if [ -f "$CURR_PATH" ]; then
        CARRIER_UP_COUNT=$(<"${CURR_PATH}")
        if [ -n "$CARRIER_UP_COUNT" ]; then
            echo "Carrier up count: ${CARRIER_UP_COUNT}"
        fi
    fi

    echo ""
}

NET_PATHS=/sys/class/net/*

for f in $NET_PATHS
do
    if [[ "$f" != *\.* ]]
    then
        handle_path "${f}"
    fi
done