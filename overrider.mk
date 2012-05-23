PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=$(shell whoami)

PRODUCT_PACKAGES += \
    Superuser \
    Superuser.apk \
    su
