//
//  MasterViewController.m
//  Toolchest-Demo
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "UIViewCategoriesDemoViewController.h"

@interface DemoTableEntry : NSObject

@property (nonatomic, strong) NSString*             title;
@property (nonatomic, strong) UIViewController*     viewController;

@end

@implementation DemoTableEntry

@synthesize title, viewController;

@end

@interface MasterViewController () {
    NSMutableArray*   _demos;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    _demos = [NSMutableArray array];
    
    [self insertNewDemo:@"UIView Demos" withController: [[UIViewCategoriesDemoViewController alloc] init]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)insertNewDemo:(NSString*) title withController: (UIViewController*) viewController
{
    DemoTableEntry* entry = [[DemoTableEntry alloc] init];
    entry.title = title;
    entry.viewController = viewController;
    [_demos insertObject:entry atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _demos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    DemoTableEntry* object = [_demos objectAtIndex:indexPath.row];
    cell.textLabel.text = object.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoTableEntry* entry = [_demos objectAtIndex:indexPath.row];
    [[self navigationController] pushViewController:entry.viewController animated:TRUE];
}

@end