# CAPerfHUD
Enable system-wide performance HUD for iOS 13+. Requires jailbreak or TrollStore.

![C4EBC522-2C77-4D92-81D0-F5B38C1DF0D0](https://github.com/khanhduytran0/CAPerfHUD/assets/40482367/de6ce69b-2636-46bc-9072-ad2687c4b1a3)


## Notes
- iOS 12 (and below?) support is possible, but I couldn't find any similar entitlement, since `com.apple.QuartzCore.debug` was not there.
- Some measurements may not work (frequencies, power consumption, display EDR).
- Change lasts until backboardd restarts (respring)

## Building
```
export THEOS=/path/to/theos

# Build rootful deb
make package PACKAGE_FORMAT=deb

# Build rootless deb
make package PACKAGE_FORMAT=deb THEOS_PACKAGE_SCHEME=rootless

# Build ipa for TrollStore
make package PACKAGE_FORMAT=ipa
```

## License
[Apache License 2.0](https://github.com/khanhduytran0/CAPerfHUD/blob/main/LICENSE).
