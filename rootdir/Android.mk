LOCAL_PATH:= $(call my-dir)

INITRC_REQUIRED_FILES :=

INITRC_FILES := $(shell find $(LOCAL_PATH)/etc/ -not -type d)
INITRC_FILES := $(patsubst $(LOCAL_PATH)/etc/%, %, $(INITRC_FILES))

define prebuilt-rule
    INITRC_FILE_NAME := $$(notdir $(1))
    INITRC_REQUIRED_FILE := $$(INITRC_FILE_NAME)
    INITRC_REQUIRED_FILES += $$(INITRC_REQUIRED_FILE)

    include $$(CLEAR_VARS)

    LOCAL_MODULE := $$(INITRC_REQUIRED_FILE)
    LOCAL_MODULE_CLASS := $(2)
    LOCAL_MODULE_TAGS := optional eng
    LOCAL_SRC_FILES := etc/$(1)
    LOCAL_MODULE_PATH := $$(TARGET_ROOT_OUT)

    # For debugging
    # (info )
    # (info INITRC_FILE_NAME = $(INITRC_FILE_NAME))
    # (info LOCAL_MODULE = $(LOCAL_MODULE))
    # (info LOCAL_MODULE_CLASS = $(LOCAL_MODULE_CLASS))
    # (info LOCAL_SRC_FILES = $(LOCAL_SRC_FILES))
    # (info LOCAL_MODULE_PATH = $(LOCAL_MODULE_PATH))

    include $$(BUILD_PREBUILT)
endef

$(foreach p, $(INITRC_FILES), $(eval $(call prebuilt-rule,$(p),ETC)))

# initrc
include $(CLEAR_VARS)
LOCAL_MODULE := initrc_me176c
LOCAL_MODULE_TAGS := optional eng
LOCAL_REQUIRED_MODULES := $(INITRC_REQUIRED_FILES)
include $(BUILD_PHONY_PACKAGE)

# fstab

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.me176c
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.charger.me176c
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
