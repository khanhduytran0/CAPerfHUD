#import "CAPHMenuModule.h"

@implementation CAPHMenuModule
@synthesize backgroundViewController;

- (instancetype)init {
    if ((self = [super init])) {
        _contentViewController = [[CAPHMenuModuleViewController alloc] init];
        
    }
    return self;
}

@end
