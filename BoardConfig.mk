#
# Copyright (C) 2017 The LineageOS Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from oneplus msm8998-common
include device/oneplus/msm8998-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/dumpling

# Assertions
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := dumpling,OnePlus5T,oneplus5t

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# inherit from the proprietary version
include vendor/oneplus/dumpling/BoardConfigVendor.mk
