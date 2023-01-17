#
# Copyright (C) 2017 The LineageOS Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from dumpling device
$(call inherit-product, device/oneplus/dumpling/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_dumpling
PRODUCT_DEVICE := dumpling
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := ONEPLUS A5010

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_SYSTEM_DEVICE := OnePlus5T
PRODUCT_SYSTEM_NAME := OnePlus5T

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=OnePlus5T \
    TARGET_PRODUCT=OnePlus5T

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="OnePlus5T-user 10 QKQ1.191014.012 2010292059 release-keys"

BUILD_FINGERPRINT := OnePlus/OnePlus5T/OnePlus5T:10/QKQ1.191014.012/2010292059:user/release-keys

TARGET_VENDOR := oneplus
