#!/bin/bash
local="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $local/../../build/target/product/security
if ( ! find superuser.pk8 &> /dev/null);then
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.pk8
	wget https://github.com/ChainsDD/platform_build/raw/master/target/product/security/superuser.x509.pem
fi

cd $local/../../build/core
if ( ! grep -q "PRODUCT_BUILD_PROP_OVERRIDES" product.mk );then
	sed -i -e '/_product_var_list :=/ a \
    PRODUCT_BUILD_PROP_OVERRIDES \\' \
	product.mk
fi

if ( ! grep -q "PRODUCT_BUILD_PROP_OVERRIDES" product_config.mk );then
	sed -i -e '/.PRODUCT_PACKAGE_OVERLAYS/ a \
PRODUCT_BUILD_PROP_OVERRIDES := \\' \
	-e '/PRODUCT_BUILD_PROP_OVERRIDES/ a \
                $(strip $(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_BUILD_PROP_OVERRIDES))' \
	product_config.mk
fi

if ( ! grep -q "PRODUCT_BUILD_PROP_OVERRIDES" Makefile );then
	sed -i -e '/TARGET_AAPT_CHARACTERISTICS/ a \
			$(PRODUCT_BUILD_PROP_OVERRIDES) \\' \
	Makefile
fi

cd $local/../../device/*/$SCRIPT_DEVICE
if ( ! grep -q "overrider.mk" device.mk );then
	cd $local
	sed -i -e '$ a \
$(call inherit-product, vendor/swordrune10/overrider.mk)' \
	device.mk
fi
