#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/hw/fingerprint.goodix.so | vendor/lib64/hw/fingerprint.goodix.so)
            sed -i "s|\x00goodix.fingerprint\x00|\x00fingerprint\x00\x00\x00\x00\x00\x00\x00\x00|" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=dumpling
export DEVICE_COMMON=msm8998-common
export VENDOR=oneplus

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
