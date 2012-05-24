PRODUCT_PROPERTY_OVERRIDES := \
    ro.rommanager.developerid=$(shell whoami)

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false

PRODUCT_PACKAGES += \
    Superuser \
    Superuser.apk \
    su
