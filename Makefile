FINALPACKAGE := 1
TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = CAPerfHUD

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = CAPerfHUD

CAPerfHUD_FILES = main.m AppDelegate.m SceneDelegate.m ViewController.m
CAPerfHUD_FRAMEWORKS = UIKit QuartzCore
CAPerfHUD_CFLAGS = -fobjc-arc
CAPerfHUD_CODESIGN_FLAGS = -Sentitlements.xml

include $(THEOS_MAKE_PATH)/application.mk
