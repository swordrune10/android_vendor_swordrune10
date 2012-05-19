#!/bin/bash
cd vendor/swordrune10
echo "$(call inherit-product-if-exists, vendor/swordrune10/overrider.mk)" \
>> device/samsung/tuna/device.mk
