$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/sp8810/sp8810-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/sp8810/overlay

LOCAL_PATH := device/samsung/sp8810
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/sp8810/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/sp8810/recovery/root/system/bin ../../sbin/sh)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/fstab.sp8810:root/fstab.sp8810 \
    $(LOCAL_PATH)/recovery/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/recovery/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    $(LOCAL_PATH)/recovery/ueventd.sp8810.rc:root/ueventd.sp8810.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.debuggable=1 \
    persist.sys.usb.config=adb \
    service.adb.root=1

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_sp8810
PRODUCT_DEVICE := sp8810

TARGET_BUILD_VARIANT := eng
