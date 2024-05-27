#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from gtactive2wifi device
$(call inherit-product, device/samsung/gtactive2wifi/device.mk)

PRODUCT_DEVICE := gtactive2wifi
PRODUCT_NAME := omni_gtactive2wifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T390
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung---

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gtactive2wifixx-user 9 PPR1.180610.011 T390XXSACUJ1 release-keys"

BUILD_FINGERPRINT := samsung/gtactive2wifixx/gtactive2wifi:9/PPR1.180610.011/T390XXSACUJ1:user/release-keys
