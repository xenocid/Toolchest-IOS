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
    NSMutableArray*   _tableViewItems;
}
@end

@implementation MasterViewController

- (id) init
{
    if(self = [super init]) {
        _tableViewItems = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
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

    [_tableViewItems insertObject:entry atIndex:_tableViewItems.count];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_tableViewItems.count inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableViewItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* REUSABLE_CELL_IDENTIFIER = @"DemoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: REUSABLE_CELL_IDENTIFIER];
    
    if(nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:REUSABLE_CELL_IDENTIFIER];
    }

    DemoTableEntry* object = [_tableViewItems objectAtIndex:indexPath.row];
    cell.textLabel.text = object.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoTableEntry* entry = [_tableViewItems objectAtIndex:indexPath.row];
    [[self navigationController] pushViewController:entry.viewController animated:TRUE];
}

@end
