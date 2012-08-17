//
//  UIViewCategoriesDemo.m
//  Toolchest-Demo
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "UIViewCategoriesDemoViewController.h"

@interface UIViewCategoriesDemoViewController ()

@end

@implementation UIViewCategoriesDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
        label.text = @"Hello";
        [self.view addSubview:label];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
