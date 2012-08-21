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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    label.text = @"Hello";
    [self.view addSubview:label];
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
