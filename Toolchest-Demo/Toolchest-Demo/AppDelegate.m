//
//  AppDelegate.m
//  Toolchest-Demo
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface AppDelegate ()
{
    UIWindow*               _window;
    UINavigationController* _navigationController;
    MasterViewController*   _rootViewController;
    NSMutableArray*         _tableViewControllersStack;
}

@end

@implementation AppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize rootViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"demos" ofType:@"xml"];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData: [NSData dataWithContentsOfFile: filePath]];
    
    parser.delegate = self;
    [parser parse];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"demos"]) {
        
        self.rootViewController = [[MasterViewController alloc] init];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];
        self.window.rootViewController = self.navigationController;
        
        _tableViewControllersStack = [NSMutableArray array];
        [_tableViewControllersStack insertObject:self.rootViewController atIndex:_tableViewControllersStack.count];
        
    } else if ([elementName isEqualToString:@"section"]) {
        
        MasterViewController* currentMasterViewController = [_tableViewControllersStack lastObject];
        MasterViewController* newMasterViewController = [[MasterViewController alloc] init];
        [currentMasterViewController insertNewDemo: [attributeDict objectForKey:@"title"] withController: newMasterViewController];
        [_tableViewControllersStack insertObject:newMasterViewController atIndex:_tableViewControllersStack.count];
        
    } else if ([elementName isEqualToString:@"demo"]) {
        MasterViewController* currentMasterViewController = [_tableViewControllersStack lastObject];
        Class className = NSClassFromString([attributeDict objectForKey:@"controller"]);
        DetailViewController* detailController = nil;
        if (className) {
            detailController = [[className alloc] init];
        } else {
            detailController = [[DetailViewController alloc] init];
        }
        [currentMasterViewController insertNewDemo:[attributeDict objectForKey:@"title"] withController:detailController];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"demos"]) {
        [self.window makeKeyAndVisible];
    } else if ([elementName isEqualToString:@"section"]) {
        [_tableViewControllersStack removeLastObject];
    } else if ([elementName isEqualToString:@"demo"]) {
        
    }
}

@end
