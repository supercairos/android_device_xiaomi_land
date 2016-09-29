#
# Copyright (C) 2016 The CyanogenMod Project
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

DEVICE_PATH := device/xiaomi/land

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Architecture
TARGET_CPU_CORTEX_A53 	:= true

TARGET_ARCH 			:= arm64
TARGET_ARCH_VARIANT 	:= armv8-a
TARGET_CPU_ABI 			:= arm64-v8a
TARGET_CPU_ABI2 		:=
TARGET_CPU_VARIANT 		:= generic

TARGET_2ND_ARCH 		:= arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI 		:= armeabi-v7a
TARGET_2ND_CPU_ABI2 	:= armeabi
TARGET_2ND_CPU_VARIANT 	:= cortex-a53

TARGET_BOARD_PLATFORM 		:= msm8937
TARGET_BOARD_PLATFORM_GPU 	:= qcom-adreno505
TARGET_BOARD_SUFFIX 		:= _64
TARGET_USES_64_BIT_BINDER 	:= true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME 	:= msm8937
TARGET_NO_BOOTLOADER 			:= true

# Kernel
TARGET_KERNEL_ARCH 					:= arm64
TARGET_KERNEL_HEADER_ARCH 			:= arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX 	:= aarch64-linux-android-

BOARD_KERNEL_CMDLINE 	 := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78B0000 androidboot.selinux=permissive
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_MKBOOTIMG_ARGS 	 := --ramdisk_offset BOARD_RAMDISK_OFFSET --tags_offset BOARD_KERNEL_TAGS_OFFSET
BOARD_KERNEL_IMAGE_NAME  := Image.gz-dtb
TARGET_KERNEL_APPEND_DTB := true
TARGET_KERNEL_SOURCE 	 := kernel/xiaomi/msm8937
TARGET_KERNEL_CONFIG 	 := cyanogenmod_land_defconfig


# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_ENABLED_ACDB_LICENSE 			:= true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD 			:= true
AUDIO_FEATURE_ENABLED_APE_OFFLOAD 			:= true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP 		:= true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP 		:= true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS 			:= true
AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER 	:= true
AUDIO_FEATURE_ENABLED_FLUENCE 				:= true
AUDIO_FEATURE_ENABLED_HFP 					:= true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE 			:= true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS 	:= true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD 			:= true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 		:= true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE 			:= true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING 		:= true
AUDIO_FEATURE_ENABLED_VOICE_CONCURRENCY 	:= true
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD 		:= true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT 				:= true
BOARD_USES_ALSA_AUDIO 						:= true
USE_CUSTOM_AUDIO_POLICY 					:= 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_BTNV := true
QCOM_BT_USE_SMD_TTY := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Camera
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true
# Force camera module to be compiled only in 32-bit mode on 64-bit systems
# Once camera module can run in the native mode of the system (either
# 32-bit or 64-bit), the following line should be deleted
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Charger
# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += hardware/cyanogen/cmhw

# CPUSETS
ENABLE_CPUSETS := true

# CNE
BOARD_USES_QCNE := true
TARGET_LDPRELOAD := libNimsWrap.so

# Enables CSVT
TARGET_USES_CSVT := true

# Dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

BOARD_EGL_CFG := $(DEVICE_PATH)/egl.cfg

# Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_CRYPTFS_HW_PATH := device/qcom/common/cryptfs_hw

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE 		:= 0x04000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 0x04000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE 	:= 2684354560
BOARD_CACHEIMAGE_PARTITION_SIZE 	:= 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE 	:= ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE 	:= 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_OEMIMAGE_PARTITION_SIZE 		:= 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 10791377920 # 10791394304 - 16384
BOARD_FLASH_BLOCK_SIZE 				:= 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
USE_DEVICE_SPECIFIC_LOC_API := true
TARGET_NO_RPC := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_land
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_RECOVERY_DEVICE_MODULES := libinit_land

# Keymaster
TARGET_PROVIDES_KEYMASTER := true

# Lights
BOARD_LIGHTS_VARIANT 		:= aw2013
TARGET_PROVIDES_LIBLIGHT 	:= true

# Malloc
MALLOC_IMPL := dlmalloc

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Qualcomm
BOARD_USES_QCOM_HARDWARE 	:= true
BOARD_USES_QC_TIME_SERVICES := true

# Recovery
RECOVERY_FSTAB_VERSION 						:= 2
TARGET_RECOVERY_FSTAB 						:= $(DEVICE_PATH)/rootdir/etc/fstab.qcom
BOARD_HAS_LARGE_FILESYSTEM 					:= true
RECOVERY_SDCARD_ON_DATA 					:= true
TARGET_RECOVERY_LCD_BACKLIGHT_PATH 			:= \"/sys/class/leds/lcd-backlight/brightness\"
BOARD_USE_CUSTOM_RECOVERY_FONT 				:= \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT 				:= "RGB_565"
RECOVERY_GRAPHICS_USE_LINELENGTH 			:= true
TARGET_RECOVERY_QCOM_RTC_FIX 				:= true

# RIL
TARGET_RIL_VARIANT := caf
PROTOBUF_SUPPORTED := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Sensors
USE_SENSOR_MULTI_HAL := true

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

# Wifi
BOARD_HAS_QCOM_WLAN 				:= true
BOARD_HAS_QCOM_WLAN_SDK 			:= true
BOARD_HOSTAPD_DRIVER 				:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB 			:= lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE 					:= qcwcn
BOARD_WPA_SUPPLICANT_DRIVER 		:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 	:= lib_driver_cmd_qcwcn
TARGET_PROVIDES_WCNSS_QMI   		:= true
TARGET_USES_WCNSS_CTRL      		:= true
TARGET_USES_QCOM_WCNSS_QMI  		:= true
WIFI_DRIVER_FW_PATH_AP 				:= "ap"
WIFI_DRIVER_FW_PATH_STA 			:= "sta"
WPA_SUPPLICANT_VERSION 				:= VER_0_8_X
TARGET_PROVIDES_WCNSS_QMI 			:= true
TARGET_USES_QCOM_WCNSS_QMI 			:= true
WIFI_DRIVER_MODULE_PATH 			:= "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME 			:= "wlan"

#Enable SSC Feature
TARGET_USES_SSC := true

#Enabling IMS Feature
TARGET_USES_IMS := TRUE

#PCI RCS
TARGET_USES_PCI_RCS := true

# inherit from the proprietary version
-include vendor/xiaomi/land/BoardConfigVendor.mk
