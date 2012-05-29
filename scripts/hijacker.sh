#!/bin/bash
cd $ANDROID_BUILD_TOP/build/target/product/security
if ( ! find superuser.pk8 &> /dev/null);then
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.pk8
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.x509.pem
fi

cd $ANDROID_BUILD_TOP/device/*/$TARGET_PRODUCT
if ( ! grep -q "overrider.mk" full_$TARGET_PRODUCT.mk );then
	sed -i -e '/full_base.*.mk/ i \
$(call inherit-product, vendor/swordrune10/overrider.mk)' \
	full_$TARGET_PRODUCT.mk
fi
