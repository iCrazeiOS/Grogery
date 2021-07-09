export PREFIX		     = $(THEOS)/toolchain/Xcode11.xctoolchain/usr/bin/
export SDKVERSION        = 14.4
export ARCHS        	 = arm64 arm64e
INSTALL_TARGET_PROCESSES = YouTube

include $(THEOS)/makefiles/common.mk

TWEAK_NAME     			 = Grogery
Grogery_FILES            = Tweak.xm
Grogery_CFLAGS           = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS              += Preferences
include $(THEOS_MAKE_PATH)/aggregate.mk
