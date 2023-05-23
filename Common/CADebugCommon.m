#import "CADebugCommon.h"

@implementation CADebugCommon

+ (NSArray *)perfHUDLevelNames {
    return @[@"Off", @"Basic", @"Backdrop", @"Particles", @"Full",
        @"Frequencies", @"Power", @"FPS only", @"Display", @"Glitches"];
};

+ (NSInteger)perfHUDLevel {
    if (!CARenderServerGetDebugOption(0, CA_DEBUG_OPTION_PERF_HUD)) {
        return 0;
    }
    return CARenderServerGetDebugValue(0, 1)+1;
}

+ (void)setPerfHUDLevel:(NSInteger)level {
    CARenderServerSetDebugOption(0, CA_DEBUG_OPTION_PERF_HUD, level != 0);
    if (level > 0) {
        CARenderServerSetDebugValue(0, 1, level-1);
    }
}

@end
