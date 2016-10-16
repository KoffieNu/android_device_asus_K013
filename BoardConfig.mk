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

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/lenovo/baytrail
TARGET_KERNEL_ARCH := x86_64
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_CONFIG := cyanogenmod_K013_8_defconfig

# Disable building until we really support them.
TARGET_NO_RECOVERY := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
include device/intel/baytrail-common/BoardConfigCommon.mk

# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := device/asus/K013/kernel-headers

# Kernel cmdline
BOARD_KERNEL_CMDLINE := loglevel=7 androidboot.bootmedia.sdcard
BOARD_KERNEL_CMDLINE += androidboot.hardware=me176c watchdog.watchdog_thresh=60
BOARD_KERNEL_CMDLINE += androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx
BOARD_KERNEL_CMDLINE += androidboot.serialno=01234567890123456789
BOARD_KERNEL_CMDLINE += oops=panic panic=40 vmalloc=172M debug_locks=0 bootboost=1
BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.vblankoffdelay=1 acpi_backlight=vendor
BOARD_KERNEL_CMDLINE += i915.mipi_panel_id=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x0071bc20
BOARD)RAMDISK_OFFSET := 0x00144e00
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1879048192
BOARD_USERDATAIMAGE_PARTITION_SIIZE := 12285078528

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# adbd fix
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Bluetooth :
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/K013/bluetooth

# GPS
BOARD_HAVE_GPS := true

# Init

TARGET_PROVIDES_INIT_RC := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_FSTAB := device/asus/K013/recovery/recovery.fstab

ifneq ($(wildcard bootable/recovery-twrp),)
  include device/asus/K013/recovery/twrp.mk
endif

# WiFi :
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
CONFIG_HS20 := true
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcmdhd.bin"

# Use the non-open-source-parts, if they're present :
-include vendor/asus/K013/BoardConfigVendor.mk
