#!/bin/bash
local="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $local/../../build/target/product/security
if ( ! find superuser.pk8 &> /dev/null);then
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.pk8
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.x509.pem
fi
cd $local/../../device/*/$SCRIPT_DEVICE
if ( ! grep -q "overrider.mk" device.mk );then
	cd $local
	sed -i -e '/# Everything in this directory will become public/ a \
$(call inherit-product, vendor/swordrune10/overrider.mk)' \
	../../device/*/$SCRIPT_DEVICE/device.mk
fi
