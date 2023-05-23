ARCHS := arm64
FINALPACKAGE := 1
TARGET := iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = CADebugHelper

CADebugHelper_FILES = main.m ../../Common/CADebugCommon.m
CADebugHelper_CFLAGS = -fobjc-arc -I../../Common
CADebugHelper_FRAMEWORKS = QuartzCore
CADebugHelper_CODESIGN_FLAGS = -Sentitlements.xml
CADebugHelper_INSTALL_PATH = /usr/bin

include $(THEOS_MAKE_PATH)/tool.mk
