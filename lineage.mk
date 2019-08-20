# Boot animation
TARGET_SCREEN_WIDTH := 600
TARGET_SCREEN_HEIGHT := 1024

$(call inherit-product-if-exists, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/amazon/mustang/full_mustang.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mustang
PRODUCT_NAME := lineage_mustang
PRODUCT_BRAND := google
PRODUCT_MODEL := Fire
PRODUCT_MANUFACTURER := amzn

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=mustang \
    BUILD_FINGERPRINT=Amazon/mustang/mustang:6.0/NS6312/1827N:user/amz-p,release-keys
    PRIVATE_BUILD_DESC="mustang-user 6.0 NS6312 1827 amz-p,release-keys"
