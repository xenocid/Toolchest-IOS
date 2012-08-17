//
//  TCArrayExtensionsTests.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/16/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "TCArrayExtensionsTests.h"

#import "NSArray+TCExtensions.h"

@implementation TCArrayExtensionsTests

-(void) testSelect
{
    NSArray* digits1 = [[NSArray arrayWithNumberSequence:100] select:^BOOL(id value) {
        return 0 == ([value integerValue] % 2);
    }];
    NSMutableArray* controlDigits1 = [NSMutableArray array];
    for(int i = 0; i < 50; i++) {
        [controlDigits1 addObject: [NSNumber numberWithInteger: 2*i]];
    }
    
    for(int i = 0; i < 50; i++) {
        STAssertEquals([[digits1 objectAtIndex:i] integerValue], [[controlDigits1 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
}

-(void) testEach
{
    NSMutableArray* digits1 = [NSMutableArray array];
    [[NSArray arrayWithNumberSequence:10] each:^(id value) {
        [digits1 addObject: [NSNumber numberWithInteger: [value integerValue] * 3]];
    }];
    NSMutableArray* controlDigits1 = [NSMutableArray array];
    for(int i = 0; i < 10; i++) {
        [controlDigits1 addObject: [NSNumber numberWithInteger: i * 3]];
    }
    
    for(int i = 0; i < 10; i++) {
        STAssertEquals([[digits1 objectAtIndex:i] integerValue], [[controlDigits1 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
}

-(void) testArrayWithNumberSequence
{
    NSArray* digits1 = [NSArray arrayWithNumberSequence:5];
    NSMutableArray* controlDigits1 = [NSMutableArray array];
    for(int i = 0; i < 5; i++) {
        [controlDigits1 addObject: [NSNumber numberWithInteger:i]];
    }
    
    for(int i = 0; i < 5; i++) {
        STAssertEquals([[digits1 objectAtIndex:i] integerValue], [[controlDigits1 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
    
    NSArray* digits2 = [NSArray arrayWithNumberSequence:5 startingAt:-2];
    NSMutableArray* controlDigits2 = [NSMutableArray array];
    for(int i = -2; i < 3; i++) {
        [controlDigits2 addObject: [NSNumber numberWithInteger:i]];
    }
    
    for(int i = 0; i < 5; i++) {
        STAssertEquals([[digits2 objectAtIndex:i] integerValue], [[controlDigits2 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
    
    NSArray* digits3 = [NSArray arrayWithNumberSequence:5 startingAt:50 withStep:25];
    NSMutableArray* controlDigits3 = [NSMutableArray array];
    for(int i = 0; i < 5; i++) {
        [controlDigits3 addObject: [NSNumber numberWithInteger:50 + i * 25]];
    }
    
    for(int i = 0; i < 5; i++) {
        STAssertEquals([[digits3 objectAtIndex:i] integerValue], [[controlDigits3 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
}

@end
