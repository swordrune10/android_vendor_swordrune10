PRODUCT_PROPERTY_OVERRIDES := \
    ro.rommanager.developerid=$(shell whoami) \
    ro.com.android.dataroaming=false

PRODUCT_PACKAGES += \
    Superuser \
    Superuser.apk \
    su
