#import <UIKit/UIKit.h>

#define CA_DEBUG_OPTION_PERF_HUD 0x24

int CARenderServerGetDebugOption(mach_port_t port, int key);
int CARenderServerGetDebugValue(mach_port_t port, int key);
void CARenderServerSetDebugOption(mach_port_t port, int key, int value);
void CARenderServerSetDebugValue(mach_port_t port, int key, int value);

@interface CADebugCommon : NSObject

+ (NSArray *)perfHUDLevelNames;
+ (NSInteger)perfHUDLevel;
+ (void)setPerfHUDLevel:(NSInteger)level;

@end
