#!/bin/bash
cd vendor/swordrune10
sed -i -e '$ a \
"$(call inherit-product-if-exists, vendor/swordrune10/overrider.mk)"' \
device/samsung/tuna/device.mk
