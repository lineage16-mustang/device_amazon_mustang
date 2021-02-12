DEVICE_COMMON := device/amazon/mustang
KERNEL_COMMON := kernel/amazon/mustang
VENDOR_COMMON := vendor/amazon/mustang

# headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_COMMON)/include

# inherit from the proprietary version
-include $(VENDOR_COMMON)/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM := mt8163
TARGET_BOARD_PLATFORM_GPU := mali-720mp2


# Bootloader
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_VARIANT:= cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

# Kernel Config
MTK_APPENDED_DTB_SUPPORT := true
BOARD_KERNEL_BASE := 0x40080000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x07f80000
BOARD_RAMDISK_OFFSET := 0x03400000
BOARD_SECOND_OFFSET := 0x00e80000

BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
    --second_offset $(BOARD_SECOND_OFFSET)

BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := $(KERNEL_COMMON)
KERNEL_TOOLCHAIN_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/arm/gcc-linaro-6.3.1-2017.05-x86_64_arm-eabi/bin/arm-eabi-

TARGET_KERNEL_CONFIG := mustang_defconfig
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_HAS_MTK_HARDWARE := true

# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor
BOARD_NEEDS_VENDORIMAGE_SYMLINK := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Binder API version
TARGET_USES_64_BIT_BINDER := true

BOARD_NO_SECURE_DISCARD := true

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_COMMON)/bluetooth

# Graphics
BOARD_EGL_CFG := $(DEVICE_COMMON)/configs/egl.cfg
USE_OPENGL_RENDERER := true
VSYNC_EVENT_PHASE_OFFSET_NS := 0
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3151745024
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11633933824
BOARD_CACHEIMAGE_PARTITION_SIZE := 499261440
BOARD_VENDORIMAGE_PARTITION_SIZE := 224350208
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_USE_EXT4 := true

BLOCK_BASED_OTA := true

# Seccomp filter
BOARD_SECCOMP_POLICY += $(DEVICE_COMMON)/seccomp

# SELinux
#BOARD_SEPOLICY_DIRS += $(DEVICE_COMMON)/sepolicy

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

# Shims
LINKER_FORCED_SHIM_LIBS := \
    /system/lib/libasp.so|libshim_liblog.so \
    /system/lib/libbinder.so|libshim_libbinder.so \
    /system/lib/liblog.so|libshim_liblog.so \
    /system/lib/libcutils.so|libshim_liblog.so \
    /system/vendor/lib/libwvm.so|libshim_libwvm.so \
    /system/lib/libgui.so|libshim_libgui.so

# TWRP
ifneq (,$(strip $(wildcard bootable/recovery-twrp/twrp.cpp)))
RECOVERY_VARIANT := twrp
endif
DEVICE_RESOLUTION := 600x1024
TW_EXCLUDE_MTP := false
RECOVERY_SDCARD_ON_DATA := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_FSTAB_VERSION := 2
TW_THEME := landscape_mdpi
#TWRP_EVENT_LOGGING := true
RECOVERY_TOUCHSCREEN_SWAP_XY := true
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#RECOVERY_TOUCHSCREEN_FLIP_Y := true 
RECOVERY_TOUCHSCREEN_FLIP_X := true
BOARD_HAS_FLIPPED_SCREEN := true

MALLOC_SVELTE := true

# Disable API check
WITHOUT_CHECK_API := true
