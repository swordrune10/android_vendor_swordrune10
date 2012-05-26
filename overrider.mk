PRODUCT_PROPERTY_OVERRIDES := \
    ro.rommanager.developerid=$(shell whoami)

MOD_VERSION := $SCRIPT_REPO-ics-$(date +%Y%m%d)-$SCRIPT_DEVICE

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.modversion=$(MOD_VERSION) \
    ro.config.ringtone=CASSIOPEIA.ogg \
    ro.config.notification_sound=Fluorine.ogg \
    ro.config.alarm_alert=Hassium.ogg

SOUNDS_PATH:= frameworks/base/data/sounds

PRODUCT_COPY_FILES += \
	$(SOUNDS_PATH)/alarms/ogg/Hassium.ogg:system/media/audio/alarms/Hassium.ogg

PRODUCT_PACKAGES += \
    Superuser \
    Superuser.apk \
    su
