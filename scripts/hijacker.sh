#!/bin/bash
cd $ANDROID_BUILD_TOP/build/target/product/security
if ( ! find superuser.pk8 &> /dev/null);then
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.pk8
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.x509.pem
fi

cd $ANDROID_BUILD_TOP/device/*/$SCRIPT_DEVICE
if ( ! grep -q "overrider.mk" full_$SCRIPT_DEVICE.mk );then
	sed -i -e '/ \
.*inherit-product/ i \
$(call inherit-product, vendor/swordrune10/overrider.mk)' \
	full_$SCRIPT_DEVICE.mk
fi
