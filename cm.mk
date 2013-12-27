## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := sp8810

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/sp8810/device_sp8810.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := sp8810
PRODUCT_NAME := cm_sp8810
PRODUCT_BRAND := samsung
PRODUCT_MODEL := sp8810
PRODUCT_MANUFACTURER := samsung
