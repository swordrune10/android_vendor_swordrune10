#!/bin/bash
local="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $local/../../device/samsung/tuna
if ( ! grep -q "overrider.mk" device.mk );then
	cd $local
	sed -i -e '$ a \
$(call inherit-product-if-exists, vendor/swordrune10/overrider.mk)' \
	../../device/samsung/tuna/device.mk
fi
