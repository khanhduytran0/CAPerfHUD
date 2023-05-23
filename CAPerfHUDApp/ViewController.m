#import "CADebugCommon.h"
#import "ViewController.h"

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
    self.modes = CADebugCommon.perfHUDLevelNames;

    self.selectedMode = [NSIndexPath indexPathForRow:CADebugCommon.perfHUDLevel inSection:0];
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

    CADebugCommon.perfHUDLevel = indexPath.row;
}

@end
