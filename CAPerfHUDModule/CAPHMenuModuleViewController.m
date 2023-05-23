#import "CADebugCommon.h"
#import "CAPHMenuModuleViewController.h"
#import <rootless.h>
#import <spawn.h>

#define HELPER_EXEC_PATH ROOT_PATH("/usr/bin/CADebugHelper")

@implementation CAPHMenuModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.glyphImage = [UIImage imageNamed:@"AppIcon"
        inBundle:[NSBundle bundleForClass:CAPHMenuModuleViewController.class]
        compatibleWithTraitCollection:nil];
    self.selectedGlyphColor = UIColor.redColor;

    self.title = @"CAPerfHUD";
    self.selected = [self execHelperSet:NO level:0];
    //self.useTrailingCheckmarkLayout = YES;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule {
    if (super.shouldBeginTransitionToExpandedContentModule) {
        return YES;
    }

    // For some reason, all menu actions are freed after dismissing the menu, so init them here
    NSArray *nameArr = CADebugCommon.perfHUDLevelNames;
    __weak CAPHMenuModuleViewController *weakSelf = self;
    for (NSString *name in nameArr) {
        if ([nameArr indexOfObject:name] == 0) continue;
        [self addActionWithTitle:name glyph:nil handler:^{
            int index = [nameArr indexOfObject:name];
            weakSelf.selected = index!=0;
            [weakSelf execHelperSet:YES level:index];
            return YES;
        }];
    }
    
    return YES;
}

- (void)buttonTapped:(CCUIButtonModuleView *)button forEvent:(UIEvent *)event {
    [super buttonTapped:button forEvent:event];
    self.selected = !self.selected;
    // Set 10 if enabled, 0 otherwise
    [self execHelperSet:YES level:self.selected*10];
}

- (NSInteger)execHelperSet:(BOOL)set level:(NSInteger)level {
    pid_t pid;
    int status;
    const char **args;
    if (set) {
        char levelStr[3];
        sprintf(levelStr, "%ld", level);
        args = (const char *[]){"CADebugHelper", levelStr, NULL};
    } else {
        args = (const char *[]){"CADebugHelper", NULL};
    }
    posix_spawn(&pid, HELPER_EXEC_PATH, NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
    wait(NULL);
    return status;
}

- (void)setSelected:(BOOL)selected {
    super.selected = selected;
    self.glyphState = (selected ? @"on" : @"off");
}

- (BOOL)_canShowWhileLocked {
    return YES;
}

@end
