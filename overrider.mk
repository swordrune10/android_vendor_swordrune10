PRODUCT_BUILD_PROP_OVERRIDES += \
    ro.rommanager.developerid=$(shell whoami) \
    ro.config.ringtone=Ring_Synth_04.ogg \
    ro.config.notification_sound=pixiedust.ogg \
    ro.config.alarm_alert=Alarm_Classic.ogg \
    ro.com.android.dataroaming=false

PRODUCT_PACKAGES += \
    SpareParts \
    Superuser \
    Superuser.apk \
    su
