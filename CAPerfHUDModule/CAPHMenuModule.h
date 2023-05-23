#import <UIKit/UIKit.h>
#import <ControlCenterUIKit/ControlCenterUIKit.h>

#import "CAPHMenuModuleViewController.h"

@interface CAPHMenuModule : NSObject <CCUIContentModule>

@property(readonly, nonatomic) CAPHMenuModuleViewController* contentViewController;

@end
