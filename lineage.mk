## Specify phone tech before including full_phone
$(call inherit-product, vendor/xenonhd/configs/telephony.mk)

# Release name
PRODUCT_RELEASE_NAME := logan2g

# Inherit device configuration
$(call inherit-product, device/samsung/logan2g/full_logan2g.mk)

# Override build properties.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=logan2gxx \
    TARGET_DEVICE=logan2g \
    BUILD_FINGERPRINT="samsung/logan2gxx/logan2g:4.1.2/JZO54K/S7262XEUANE1:user/release-keys" \
    PRIVATE_BUILD_DESC="logan2gxx-user 4.1.2 JZO54K S7262XEUANE1 release-keys"
    

PRODUCT_NAME := xenonhd_logan2g
PRODUCT_DEVICE := logan2g

# Root
WITH_SU=true
