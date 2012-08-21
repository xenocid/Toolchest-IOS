//
//  AppDelegate.h
//  Toolchest-Demo
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, NSXMLParserDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) IBOutlet UINavigationController* navigationController;
@property (nonatomic, strong) IBOutlet MasterViewController* rootViewController;

@end
