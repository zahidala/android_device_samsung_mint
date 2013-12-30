$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/mint/mint-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/mint/overlay

LOCAL_PATH := device/samsung/mint

#
#ifeq ($(TARGET_PREBUILT_KERNEL),)
#	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
#else
#	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif
#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/mint/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/mint/recovery/root/system/bin ../../sbin/sh)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/init.goldfish.rc:root/init.goldfish.rc \
    $(LOCAL_PATH)/boot/init.rc:root/init.rc \
    $(LOCAL_PATH)/boot/init.sp8810.rc:root/init.sp8810.rc \
    $(LOCAL_PATH)/boot/init.sp8810.usb.rc:root/init.sp8810.usb.rc \
    $(LOCAL_PATH)/boot/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/boot/init.trace.rc:root/init.trace.rc

$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/mint/root/bin)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/charge:root/bin/charge \
    $(LOCAL_PATH)/boot/vcharged:root/bin/vcharged

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/fstab.sp8810:root/fstab.sp8810

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/boot/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    $(LOCAL_PATH)/boot/ueventd.sp8810.rc:root/ueventd.sp8810.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_mint
PRODUCT_DEVICE := mint

TARGET_BUILD_VARIANT := userdebug
#PRODUCT_LOCALES := it_IT en_US
PRODUCT_AAPT_CONFIG := normal ldpi mdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

