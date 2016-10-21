#
# Copyright (C) 2016 The Android Open Source Project
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
#

ifeq ($(wildcard kernel/asus/K013/cyanogenmod_K013_8_defconfig),)
include device/asus/K013/prebuilts/kernel/prebuilt_kernel.mk
endif

# we do this little trick to fall back to other density if the hdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal large xlarge ldpi mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=240

# USB Configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

# Default.prop overrides to get adb working at boot
ADDITIONAL_DEFAULT_PROPERTIES += \
  ro.secure=0 \
  ro.adb.secure=0 \

# call dalvik heap config
$(call inherit-product-if-exists, framework/native/build/tabet-7in-hdpi-1024-dalvik-heap.mk)

# Inherit platform configuration
$(call inherit-product, device/intel/baytrail-common/device-common.mk)

# Init
PRODUCT_COPY_FILES += system/core/rootdir/init.rc:root/init.aosp.rc

# Ramdisk
PRODUCT_PACKAGES += \
  initrc_me176c \
  fstab.charger.me176c \
  fstab.me176c \
  fstab \

PRODUCT_PACKAGES += \
  intel_prop \
  pclinkd \
  thermald \
  uefivar \
  uefivar_nolog \
  upi_ug31xx

# Use the non-open-source-parts, if they're present
$(call inherit-product-if-exists, vendor/asus/K013/K013-vendor.mk)
