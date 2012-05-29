#!/bin/bash
cd $ANDROID_BUILD_TOP/build/target/product/security
if ( ! find superuser.pk8 &> /dev/null);then
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.pk8
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.x509.pem
fi

AOSP_BUILD=$(echo $TARGET_PRODUCT | sed -e 's/^full_//g')

cd $ANDROID_BUILD_TOP/device/*/$AOSP_BUILD
if ( ! find bazinga.mk &> /dev/null);then
	cp  $ANDROID_BUILD_TOP/vendor/swordrune10/makefiles/bazinga.mk ./bazinga.mk
fi

# if ( ! grep -q "overrider.mk" full_$TARGET_PRODUCT.mk );then
#	sed -i -e '/full_base.*.mk/ i \
# $(call inherit-product, vendor/swordrune10/overrider.mk)' \
#	full_$TARGET_PRODUCT.mk
# fi
