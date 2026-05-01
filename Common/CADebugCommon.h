#import <UIKit/UIKit.h>

#define CA_DEBUG_FLAG_PERF_HUD 0x10000000
extern int CARenderServerGetDebugFlags(mach_port_t port);
extern int CARenderServerGetDebugValue(mach_port_t port, int key);
extern void CARenderServerSetDebugFlags(mach_port_t port, int key, int value);
extern void CARenderServerSetDebugValue(mach_port_t port, int key, int value);

@interface CADebugCommon : NSObject

+ (NSArray *)perfHUDLevelNames;
+ (NSInteger)perfHUDLevel;
+ (void)setPerfHUDLevel:(NSInteger)level;

@end
