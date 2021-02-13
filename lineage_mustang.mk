# Boot animation
TARGET_SCREEN_WIDTH := 600
TARGET_SCREEN_HEIGHT := 1024

$(call inherit-product-if-exists, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/amazon/mustang/full_mustang.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mustang
PRODUCT_NAME := lineage_mustang
PRODUCT_BRAND := google
PRODUCT_MODEL := Fire
PRODUCT_MANUFACTURER := amzn
