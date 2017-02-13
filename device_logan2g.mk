#
# Copyright (C) 2013 The CyanogenMod Project
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

# Use the Dalvik VM specific for devices with 512 MB of RAM
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Set local path
LOCAL_PATH := device/samsung/logan2g

# Softlink sh
$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/logan2g/recovery/root/system/bin ../../sbin/sh)

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.sc6820i:root/fstab.sc6820i \
    $(LOCAL_PATH)/rootdir/init.bt.rc:root/init.bt.rc \
    $(LOCAL_PATH)/rootdir/init.sc6820i.rc:root/init.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/init.sc6820i.usb.rc:root/init.sc6820i.usb.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sc6820i.rc:root/ueventd.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/bin/charge:root/bin/charge \
    $(LOCAL_PATH)/rootdir/bin/poweroff_alarm:root/bin/poweroff_alarm \
    $(LOCAL_PATH)/rootdir/bin/rawdatad:root/bin/rawdatad 

# Packages
# Filesystem
PRODUCT_PACKAGES += \
    setup_fs \
    make_ext4fs \
    e2fsck 

# f2fs
PRODUCT_PACKAGES += \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Properties
# Default properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# System.prop
PRODUCT_PROPERTY_OVERRIDES += \
   ro.sf.lcd_density=240 \
   ro.sf.lcd_width = 52 \
   ro.sf.lcd_height = 87 \
   ro.opengles.version=131072 \
   ro.product.hardware=logan \
   ro.lcd_brightness=160 \

# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs before they
# have a chance to cause problems.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=128m \
    ro.crypto.state=unsupported \
