# CAPerfHUD
Enable system-wide performance HUD for iOS 13+. Requires jailbreak or TrollStore.

![C4EBC522-2C77-4D92-81D0-F5B38C1DF0D0](https://github.com/khanhduytran0/CAPerfHUD/assets/40482367/de6ce69b-2636-46bc-9072-ad2687c4b1a3)

## Notes
- iOS 12 (and below?) support is possible, but I couldn't find any similar entitlement, since `com.apple.QuartzCore.debug` was not there.
- Some measurements may not work (frequencies, power consumption, display EDR).
- Change lasts until backboardd restarts (respring)

## Source code structure
- `CAPerfHUDApp`: Application for AppSync/TrollStore.
- `CAPerfHUDModule`: CCSupport module for jailbroken devices.
- `CAPerfHUDModule/CADebugHelper`: helper executable to get/set debug values because SpringBoard isn't entitled to do so.

## Building
```
export THEOS=/path/to/theos

# Build ipa for AppSync/TrollStore
make -C CAPerfHUDApp package PACKAGE_FORMAT=ipa

# Before building for the opposite deb package scheme, make sure to add "clean" before "package"

# Build rootful deb for CCSupport
make -C CAPerfHUDModule package

# Build rootless deb for CCSupport
make -C CAPerfHUDModule package THEOS_PACKAGE_SCHEME=rootless
```

## License
[Apache License 2.0](https://github.com/khanhduytran0/CAPerfHUD/blob/main/LICENSE).
