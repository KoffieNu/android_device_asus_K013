#
# Copyright 2016 The CyanogenMod Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Inherit the base android system
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/asus/K013/device.mk)

PRODUCT_RUNTIMES := runtime_libart_default

# Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_K013
PRODUCT_BRAND := Asus
PRODUCT_MODEL := ME176CX
PRODUCT_MANUFACTURER := ASUS
PRODUCT_DEVICE := K013

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=K013
