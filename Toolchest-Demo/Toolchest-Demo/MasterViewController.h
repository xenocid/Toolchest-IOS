//
//  MasterViewController.h
//  Toolchest-Demo
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController

- (void)insertNewDemo:(NSString*) title withController: (UIViewController*) viewController;

@end
