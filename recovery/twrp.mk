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

#TWRP
TARGET_RECOVERY_FSTAB := device/asus/K013/recovery/twrp.fstab

RECOVERY_VARIANT := twrp
RECOVERY_SDCARD_ON_DATA := true

#TWRP Our parted binary is armv7 only so disable partitioning since it won't work anyway
BOARD_HAS_NO_REAL_SDCARD := true

#TWRP Fix slow wiping
BOARD_SUPPRESS_EMMC_WIPE := true

TW_CUSTOM_BATTERY_PATH := "/sys/class/power_supply/bq27541_battery"

TW_THEME := portrait_hdpi
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true

#TWRP : We don't currently have SuperSU binaries for x86, need to correct this at some point
TW_EXCLUDE_SUPERSU := true

TWRP_INCLUDE_LOGCAT := true
