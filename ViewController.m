#import "ViewController.h"

#define CA_DEBUG_OPTION_PERF_HUD 0x24

int CARenderServerGetDebugOption(mach_port_t port, int key);
int CARenderServerGetDebugValue(mach_port_t port, int key);
void CARenderServerSetDebugOption(mach_port_t port, int key, int value);
void CARenderServerSetDebugValue(mach_port_t port, int key, int value);

@interface ViewController ()
@property(nonatomic) NSArray* modes;
@property(nonatomic) NSIndexPath* selectedMode;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.title = @"CAPerfHUD";
    self.modes = @[@"Off", @"Basic", @"Backdrop", @"Particles", @"Full", @"Frequencies", @"Power", @"FPS only", @"Display", @"Glitches"];

    int selected = -1;
    if (CARenderServerGetDebugOption(0, CA_DEBUG_OPTION_PERF_HUD)) {
        selected = CARenderServerGetDebugValue(0, 1);
    }
    self.selectedMode = [NSIndexPath indexPathForRow:selected+1 inSection:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.modes[indexPath.row];
    if (self.selectedMode.row == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:self.selectedMode];
    selectedCell.accessoryType = UITableViewCellAccessoryNone;
    selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.selectedMode = indexPath;

    int value = indexPath.row - 1;
    CARenderServerSetDebugOption(0, CA_DEBUG_OPTION_PERF_HUD, value != -1);
    CARenderServerSetDebugValue(0, 1, value);
}

@end
