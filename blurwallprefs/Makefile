ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = blurwallprefs
blurwallprefs_FILES = BLURWALLPreferences.m
blurwallprefs_INSTALL_PATH = /Library/PreferenceBundles
blurwallprefs_FRAMEWORKS = UIKit
blurwallprefs_PRIVATE_FRAMEWORKS = Preferences
blurwallprefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
blurwallprefs_LIBRARIES += sparkcolourpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/blurwallprefs.plist$(ECHO_END)
