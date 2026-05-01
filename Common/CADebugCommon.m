#import "CADebugCommon.h"

@implementation CADebugCommon

+ (NSArray *)perfHUDLevelNames {
    return @[@"Off", @"Basic", @"Backdrop", @"Particles", @"Full",
        @"Frequencies", @"Power", @"FPS only", @"Display", @"Glitches"];
};

+ (NSInteger)perfHUDLevel {
    if (!(CARenderServerGetDebugFlags(0) & CA_DEBUG_FLAG_PERF_HUD)) {
        return 0;
    }
    return CARenderServerGetDebugValue(0, 1)+1;
}

+ (void)setPerfHUDLevel:(NSInteger)level {
    BOOL enabled = level != 0;
    int flags = CARenderServerGetDebugFlags(0);
    if (enabled) {
        flags |= CA_DEBUG_FLAG_PERF_HUD;
        if (level > 0) {
            CARenderServerSetDebugValue(0, 1, level-1);
        }
    } else {
        flags &= ~CA_DEBUG_FLAG_PERF_HUD;
    }
    CARenderServerSetDebugFlags(0, CA_DEBUG_FLAG_PERF_HUD, flags);
}

@end
