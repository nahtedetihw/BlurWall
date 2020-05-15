TARGET = iphone:clang:13.0:13.0

ARCHS = arm64 arm64e

DEBUG = 0

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BlurWall
BlurWall_FILES = Tweak.xm
BlurWall_EXTRA_FRAMEWORKS += Cephei
BlurWall_FRAMEWORKS = UIKit
BlurWall_LIBRARIES += sparkcolourpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
SUBPROJECTS += blurwallprefs
include $(THEOS_MAKE_PATH)/aggregate.mk