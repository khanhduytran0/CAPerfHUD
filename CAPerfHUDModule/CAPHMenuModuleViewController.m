#import "CADebugCommon.h"
#import "CAPHMenuModuleViewController.h"
#import <rootless.h>
#import <spawn.h>

#define HELPER_EXEC_PATH ROOT_PATH("/usr/bin/CADebugHelper")

@interface CAPHMenuModuleViewController()
@property(nonatomic, assign) int selectedLevel;
@end

@implementation CAPHMenuModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.glyphImage = [UIImage imageNamed:@"AppIcon"
        inBundle:[NSBundle bundleForClass:CAPHMenuModuleViewController.class]
        compatibleWithTraitCollection:nil];
    self.indentation = 2;
    self.selectedGlyphColor = UIColor.redColor;

    self.title = @"CAPerfHUD";
}

- (void)controlCenterWillPresent {
    self.selectedLevel = [self execHelperSet:NO level:0];
    self.selected = self.selectedLevel > 0;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule {
    return YES;
}

- (void)willTransitionToExpandedContentMode:(BOOL)animated {
    [super willTransitionToExpandedContentMode:animated];

    NSArray *nameArr = CADebugCommon.perfHUDLevelNames;
    NSMutableArray<CCUIMenuModuleItem *> *items = [NSMutableArray arrayWithCapacity:nameArr.count-1];
 
    for (int i = 1; i < nameArr.count; i++) {
        items[i-1] = [[CCUIMenuModuleItem alloc] initWithTitle:nameArr[i] identifier:nameArr[i] handler:nil];
        items[i-1].selected = i == self.selectedLevel;
    }
    self.menuItems = items;
}

- (void)buttonTapped:(CCUIButtonModuleView *)button forEvent:(UIEvent *)event {
    self.selected = !self.selected;
    // Set 10 if enabled, 0 otherwise
    self.selectedLevel = [self execHelperSet:YES level:self.selected*10];

    [super buttonTapped:button forEvent:event];
}

- (void)_handleActionTapped:(CCUIMenuModuleItemView *)view {
    [super _handleActionTapped:view];

    NSArray<CCUIMenuModuleItemView *> *menuItemsViews = ((UIStackView *)view.superview).arrangedSubviews;

    if (self.selectedLevel > 0) {
        CCUIMenuModuleItemView *lastView = menuItemsViews[self.selectedLevel-1];
        lastView.menuItem.selected = NO;
        if (self.useTrailingCheckmarkLayout) {
            lastView.trailingView = nil;
        } else {
            lastView.leadingView = nil;
        }
    }
    view.menuItem.selected = YES;
    [self _updateLeadingAndTrailingViews];

    self.selected = YES;
    self.selectedLevel = [menuItemsViews indexOfObject:view]+1;

    [self execHelperSet:YES level:self.selectedLevel];
}

- (int)execHelperSet:(BOOL)set level:(int)level {
    pid_t pid;
    int status;
    const char **args;
    if (set) {
        char levelStr[3];
        sprintf(levelStr, "%d", level);
        args = (const char *[]){"CADebugHelper", levelStr, NULL};
    } else {
        args = (const char *[]){"CADebugHelper", NULL};
    }

    status = posix_spawn(&pid, HELPER_EXEC_PATH, NULL, NULL, (char* const*)args, NULL);
    if (status != 0) {
        return 0;
    }

    if (waitpid(pid, &status, 0) == -1) {
        return 0;
    }

    return WEXITSTATUS(status);
}

- (void)setSelected:(BOOL)selected {
    super.selected = selected;
    self.glyphState = (selected ? @"on" : @"off");
}

- (BOOL)_canShowWhileLocked {
    return YES;
}

@end
