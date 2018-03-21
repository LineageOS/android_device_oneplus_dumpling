#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

export DEVICE=dumpling
export DEVICE_COMMON=msm8998-common
export VENDOR=oneplus

export DEVICE_BRINGUP_YEAR=2017

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh $@

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

function fix_goodix () {
    sed -i \
        's/\x00gf_fingerprint\x00/\x00fingerprint\x00\x00\x00\x00/' \
        "$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/"$1"
}

fix_goodix vendor/lib/hw/fingerprint.goodix.so
fix_goodix vendor/lib64/hw/fingerprint.goodix.so
