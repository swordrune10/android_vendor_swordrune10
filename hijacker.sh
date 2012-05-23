#!/bin/bash
local="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $local/../../build/target/product/security
if ( ! find superuser.pk8 &> /dev/null);then
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.pk8
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.x509.pem
fi
cd $local/../../device/samsung/tuna
if ( ! grep -q "overrider.mk" device.mk );then
	cd $local
	sed -i -e '/phone-xhdpi-1024-dalvik-heap.mk/ a \
$(call inherit-product, vendor/swordrune10/overrider.mk)' \
	../../device/samsung/tuna/device.mk
fi
