LOCAL_PATH := $(call my-dir)

$(shell ($(LOCAL_PATH)/hijacker.sh))
#include $(call inherit-product, overrider.mk)
