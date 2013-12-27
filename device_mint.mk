$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/mint/mint-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/mint/overlay

LOCAL_PATH := device/samsung/mint
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/root/fstab.sp8810:root/fstab.sp8810 \
    $(LOCAL_PATH)/prebuilt/root/init.bt.rc:root/init.bt.rc \
    $(LOCAL_PATH)/prebuilt/root/init.sp8810.rc:root/init.sp8810.rc \
    $(LOCAL_PATH)/prebuilt/root/init.sp8810.usb.rc:root/init.sp8810.usb.rc \
    $(LOCAL_PATH)/prebuilt/root/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/prebuilt/root/ueventd.sp8810.rc:root/ueventd.sp8810.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/recovery.rc:root/recovery.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/system/etc/audio_profiles.xml:system/etc/audio_profiles.xml \
    $(LOCAL_PATH)/prebuilt/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    $(LOCAL_PATH)/prebuilt/system/lib/lights.sp8810.so:system/lib/lights.sp8810.so

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_mint
PRODUCT_DEVICE := mint
