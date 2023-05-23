FINALPACKAGE := 1
TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CAPerfHUDModule
CAPerfHUDModule_BUNDLE_EXTENSION = bundle
CAPerfHUDModule_FILES = CAPHMenuModule.m CAPHMenuModuleViewController.m ../Common/CADebugCommon.m
CAPerfHUDModule_CFLAGS = -fobjc-arc -I../Common
CAPerfHUDModule_FRAMEWORKS = UIKit QuartzCore
CAPerfHUDModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CAPerfHUDModule_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
SUBPROJECTS += CADebugHelper
include $(THEOS_MAKE_PATH)/aggregate.mk
