#import <UIKit/UIKit.h>
#import <ControlCenterUIKit/CCUIContentModule.h>

#import "CAPHMenuModuleViewController.h"

@interface CAPHMenuModule : NSObject <CCUIContentModule>

@property(readonly, nonatomic) CAPHMenuModuleViewController* contentViewController;

@end
